import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:serverpod/serverpod.dart';
import 'package:my_mesl7y_app_server/src/generated/protocol.dart';

// ======================================================
// PasswordHelper
// ======================================================
class PasswordHelper {
  static const int _saltLength = 32;
  static const int _iterations = 100000;

  static String hashPassword(String password) {
    final salt = _generateSalt();
    final hash = _pbkdf2(password, salt, _iterations);
    return '$_iterations\$$salt\$$hash';
  }

  static bool verifyPassword(String password, String storedHash) {
    try {
      final parts = storedHash.split('\$');
      if (parts.length != 3) return false;
      final iterations = int.parse(parts[0]);
      final salt = parts[1];
      final expectedHash = parts[2];
      final hash = _pbkdf2(password, salt, iterations);
      return _constantTimeEqual(hash, expectedHash);
    } catch (_) {
      return false;
    }
  }

  static String _pbkdf2(String password, String salt, int iterations) {
    final passwordBytes = utf8.encode(password);
    final saltBytes = utf8.encode(salt);
    final hmac = Hmac(sha256, passwordBytes);
    var u = hmac.convert([...saltBytes, 0, 0, 0, 1]).bytes;
    var result = List<int>.from(u);
    for (int i = 1; i < iterations; i++) {
      u = hmac.convert(u).bytes;
      for (int j = 0; j < result.length; j++) {
        result[j] ^= u[j];
      }
    }
    return base64Url.encode(result);
  }

  static String _generateSalt() {
    final random = Random.secure();
    final bytes = List<int>.generate(_saltLength, (_) => random.nextInt(256));
    return base64Url.encode(bytes);
  }

  static bool _constantTimeEqual(String a, String b) {
    if (a.length != b.length) return false;
    int result = 0;
    for (int i = 0; i < a.length; i++) {
      result |= a.codeUnitAt(i) ^ b.codeUnitAt(i);
    }
    return result == 0;
  }
}

// ======================================================
// JwtHelper
// ======================================================
class JwtHelper {
  static const String _secret = String.fromEnvironment(
    'JWT_SECRET',
    defaultValue: 'change_this_super_secret_key_in_production_min_32_chars',
  );

  static const int _accessTokenExpiryHours = 24;
  static const int _refreshTokenExpiryDays = 30;

  static String generateAccessToken(int userId, String email, String role) {
    final now = DateTime.now().toUtc();
    final expiry = now.add(const Duration(hours: _accessTokenExpiryHours));
    final payload = {
      'sub': userId.toString(),
      'email': email,
      'role': role,
      'iat': now.millisecondsSinceEpoch ~/ 1000,
      'exp': expiry.millisecondsSinceEpoch ~/ 1000,
      'type': 'access',
    };
    return _buildJwt(payload);
  }

  static String generateRefreshToken() {
    final random = Random.secure();
    final bytes = List<int>.generate(64, (_) => random.nextInt(256));
    return base64Url.encode(bytes);
  }

  static Map<String, dynamic>? verifyAccessToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;
      final expectedSig = _sign('${parts[0]}.${parts[1]}');
      if (expectedSig != parts[2]) return null;
      final payloadJson = utf8.decode(
        base64Url.decode(base64Url.normalize(parts[1])),
      );
      final payload = jsonDecode(payloadJson) as Map<String, dynamic>;
      final exp = payload['exp'] as int;
      final now = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
      if (now > exp) return null;
      if (payload['type'] != 'access') return null;
      return payload;
    } catch (_) {
      return null;
    }
  }

  static String _buildJwt(Map<String, dynamic> payload) {
    final header = base64Url.encode(
      utf8.encode(jsonEncode({'alg': 'HS256', 'typ': 'JWT'})),
    );
    final body = base64Url.encode(utf8.encode(jsonEncode(payload)));
    final signature = _sign('$header.$body');
    return '$header.$body.$signature';
  }

  static String _sign(String data) {
    final key = utf8.encode(_secret);
    final bytes = utf8.encode(data);
    final hmac = Hmac(sha256, key);
    final digest = hmac.convert(bytes);
    return base64Url.encode(digest.bytes);
  }

  static DateTime get refreshTokenExpiry =>
      DateTime.now().toUtc().add(const Duration(days: _refreshTokenExpiryDays));
}

// ======================================================
// AuthMiddleware
// ======================================================
class AuthMiddleware {
  static Future<bool> requireAuth(Session session) async {
    return extractUserId(session) != null;
  }

static String? _getAuthHeader(Session session) {
  try {
    return (session as MethodCallSession)
        .httpRequest    // ← مش request
        .headers['authorization']
        ?.firstOrNull;
  } catch (_) {
    return null;
  }
}

  static int? extractUserId(Session session) {
    try {
      final authHeader = _getAuthHeader(session);
      if (authHeader == null || !authHeader.startsWith('Bearer ')) return null;
      final token = authHeader.substring(7);
      final payload = JwtHelper.verifyAccessToken(token);
      if (payload == null) return null;
      return int.tryParse(payload['sub'] as String);
    } catch (_) {
      return null;
    }
  }

  static String? extractEmail(Session session) {
    try {
      final authHeader = _getAuthHeader(session);
      if (authHeader == null || !authHeader.startsWith('Bearer ')) return null;
      final token = authHeader.substring(7);
      final payload = JwtHelper.verifyAccessToken(token);
      return payload?['email'] as String?;
    } catch (_) {
      return null;
    }
  }

  static String? extractRole(Session session) {
    try {
      final authHeader = _getAuthHeader(session);
      if (authHeader == null || !authHeader.startsWith('Bearer ')) return null;
      final token = authHeader.substring(7);
      final payload = JwtHelper.verifyAccessToken(token);
      return payload?['role'] as String?;
    } catch (_) {
      return null;
    }
  }
}

// ======================================================
// AuthProtected Mixin
// ======================================================
mixin AuthProtected on Endpoint {
  @override
  Future<bool> canUserAccessEndpoint(Session session) async {
    return AuthMiddleware.requireAuth(session);
  }

  int requireUserId(Session session) {
    final userId = AuthMiddleware.extractUserId(session);
    if (userId == null) throw Exception('unauthorized');
    return userId;
  }

  int? getUserId(Session session) {
    return AuthMiddleware.extractUserId(session);
  }

  String requireRole(Session session) {
    final role = AuthMiddleware.extractRole(session);
    if (role == null) throw Exception('unauthorized');
    return role;
  }

  void requireAdmin(Session session) {
    final role = AuthMiddleware.extractRole(session);
    if (role != 'admin') throw Exception('forbidden');
  }
}

// ======================================================
// AuthEndpoint
// ======================================================
class AuthEndpoint extends Endpoint {

  Future<void> register(
    Session session,
    String email,
    String password,
    String name,
  ) async {
    if (email.isEmpty || !email.contains('@')) {
      throw Exception('invalid_email');
    }
    if (password.length < 8) {
      throw Exception('password_too_short');
    }

    final isAdmin = password.contains('@admin');
    final cleanPassword = password.replaceAll('@admin', '');

    if (isAdmin) {
      final existing = await Admin.db.findFirstRow(
        session,
        where: (t) => t.email.equals(email.toLowerCase()),
      );
      if (existing != null) throw Exception('email_already_exists');

      await Admin.db.insertRow(
        session,
        Admin(
          email: email.toLowerCase(),
          passwordHash: PasswordHelper.hashPassword(cleanPassword),
          name: name,
          createdAt: DateTime.now().toUtc(),
          isActive: true,
        ),
      );
    } else {
      final existing = await Customer.db.findFirstRow(
        session,
        where: (t) => t.email.equals(email.toLowerCase()),
      );
      if (existing != null) throw Exception('email_already_exists');

      await Customer.db.insertRow(
        session,
        Customer(
          email: email.toLowerCase(),
          passwordHash: PasswordHelper.hashPassword(cleanPassword),
          name: name,
          createdAt: DateTime.now().toUtc(),
          isActive: true,
        ),
      );
    }
  }

  Future<Map<String, String>> login(
    Session session,
    String email,
    String password,
  ) async {
    final admin = await Admin.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email.toLowerCase()),
    );

    if (admin != null) {
      if (!admin.isActive) throw Exception('account_disabled');
      if (!PasswordHelper.verifyPassword(password, admin.passwordHash)) {
        throw Exception('invalid_credentials');
      }
      await _revokeTokens(session, admin.id!, isAdmin: true);
      return await _generateAndSaveTokens(
        session,
        id: admin.id!,
        email: admin.email,
        role: 'admin',
        isAdmin: true,
      );
    }

    final customer = await Customer.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email.toLowerCase()),
    );

    if (customer == null) throw Exception('invalid_credentials');
    if (!customer.isActive) throw Exception('account_disabled');
    if (!PasswordHelper.verifyPassword(password, customer.passwordHash)) {
      throw Exception('invalid_credentials');
    }

    await _revokeTokens(session, customer.id!, isAdmin: false);
    return await _generateAndSaveTokens(
      session,
      id: customer.id!,
      email: customer.email,
      role: 'customer',
      isAdmin: false,
    );
  }

  Future<Map<String, String>> refresh(
    Session session,
    String refreshTokenStr,
  ) async {
    final storedToken = await RefreshToken.db.findFirstRow(
      session,
      where: (t) => t.token.equals(refreshTokenStr),
    );

    if (storedToken == null) throw Exception('invalid_refresh_token');

    if (storedToken.isRevoked) {
      await _revokeTokens(
        session,
        storedToken.userId,
        isAdmin: storedToken.isAdmin,
      );
      throw Exception('refresh_token_reused');
    }

    if (DateTime.now().toUtc().isAfter(storedToken.expiresAt)) {
      await RefreshToken.db.deleteRow(session, storedToken);
      throw Exception('refresh_token_expired');
    }

    await RefreshToken.db.updateRow(
      session,
      storedToken.copyWith(isRevoked: true),
    );

    if (storedToken.isAdmin) {
      final admin = await Admin.db.findById(session, storedToken.userId);
      if (admin == null || !admin.isActive) throw Exception('user_not_found');
      return await _generateAndSaveTokens(
        session,
        id: admin.id!,
        email: admin.email,
        role: 'admin',
        isAdmin: true,
      );
    } else {
      final customer = await Customer.db.findById(session, storedToken.userId);
      if (customer == null || !customer.isActive) {
        throw Exception('user_not_found');
      }
      return await _generateAndSaveTokens(
        session,
        id: customer.id!,
        email: customer.email,
        role: 'customer',
        isAdmin: false,
      );
    }
  }

  Future<void> logout(Session session, String refreshTokenStr) async {
    final storedToken = await RefreshToken.db.findFirstRow(
      session,
      where: (t) => t.token.equals(refreshTokenStr),
    );
    if (storedToken != null) {
      await RefreshToken.db.updateRow(
        session,
        storedToken.copyWith(isRevoked: true),
      );
    }
  }

  Future<void> logoutAll(Session session, String refreshTokenStr) async {
    final storedToken = await RefreshToken.db.findFirstRow(
      session,
      where: (t) => t.token.equals(refreshTokenStr),
    );
    if (storedToken != null) {
      await _revokeTokens(
        session,
        storedToken.userId,
        isAdmin: storedToken.isAdmin,
      );
    }
  }

  Future<Map<String, dynamic>> me(Session session) async {
    final userId = _extractUserIdFromSession(session);
    final role = _extractRoleFromSession(session);
    if (userId == null) throw Exception('unauthorized');

    if (role == 'admin') {
      final admin = await Admin.db.findById(session, userId);
      if (admin == null) throw Exception('user_not_found');
      return {
        'id': admin.id,
        'email': admin.email,
        'name': admin.name ?? '',
        'role': 'admin',
        'createdAt': admin.createdAt.toIso8601String(),
      };
    } else {
      final customer = await Customer.db.findById(session, userId);
      if (customer == null) throw Exception('user_not_found');
      return {
        'id': customer.id,
        'email': customer.email,
        'name': customer.name ?? '',
        'role': 'customer',
        'createdAt': customer.createdAt.toIso8601String(),
      };
    }
  }

  Future<void> changePassword(
    Session session,
    String oldPassword,
    String newPassword,
  ) async {
    final userId = _extractUserIdFromSession(session);
    final role = _extractRoleFromSession(session);
    if (userId == null) throw Exception('unauthorized');
    if (newPassword.length < 8) throw Exception('password_too_short');

    if (role == 'admin') {
      final admin = await Admin.db.findById(session, userId);
      if (admin == null) throw Exception('user_not_found');
      if (!PasswordHelper.verifyPassword(oldPassword, admin.passwordHash)) {
        throw Exception('invalid_old_password');
      }
      await Admin.db.updateRow(
        session,
        admin.copyWith(
          passwordHash: PasswordHelper.hashPassword(newPassword),
        ),
      );
      await _revokeTokens(session, userId, isAdmin: true);
    } else {
      final customer = await Customer.db.findById(session, userId);
      if (customer == null) throw Exception('user_not_found');
      if (!PasswordHelper.verifyPassword(oldPassword, customer.passwordHash)) {
        throw Exception('invalid_old_password');
      }
      await Customer.db.updateRow(
        session,
        customer.copyWith(
          passwordHash: PasswordHelper.hashPassword(newPassword),
        ),
      );
      await _revokeTokens(session, userId, isAdmin: false);
    }
  }

  // -------------------------------------------------------
  // هيلبرز
  // -------------------------------------------------------
  Future<Map<String, String>> _generateAndSaveTokens(
    Session session, {
    required int id,
    required String email,
    required String role,
    required bool isAdmin,
  }) async {
    final accessToken = JwtHelper.generateAccessToken(id, email, role);
    final refreshTokenStr = JwtHelper.generateRefreshToken();

    await RefreshToken.db.insertRow(
      session,
      RefreshToken(
        userId: id,
        token: refreshTokenStr,
        isAdmin: isAdmin,
        expiresAt: JwtHelper.refreshTokenExpiry,
        createdAt: DateTime.now().toUtc(),
      ),
    );

    return {
      'accessToken': accessToken,
      'refreshToken': refreshTokenStr,
      'role': role,
    };
  }

  Future<void> _revokeTokens(
    Session session,
    int userId, {
    required bool isAdmin,
  }) async {
    final tokens = await RefreshToken.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) &
          t.isAdmin.equals(isAdmin) &
          t.isRevoked.equals(false),
    );
    for (final token in tokens) {
      await RefreshToken.db.updateRow(
        session,
        token.copyWith(isRevoked: true),
      );
    }
  }

 int? _extractUserIdFromSession(Session session) {
  try {
    final authHeader = (session as MethodCallSession)
        .httpRequest    // ← مش request
        .headers['authorization']
        ?.firstOrNull;
    if (authHeader == null || !authHeader.startsWith('Bearer ')) return null;
    final token = authHeader.substring(7);
    final payload = JwtHelper.verifyAccessToken(token);
    if (payload == null) return null;
    return int.tryParse(payload['sub'] as String);
  } catch (_) {
    return null;
  }
}

String? _extractRoleFromSession(Session session) {
  try {
    final authHeader = (session as MethodCallSession)
        .httpRequest    // ← مش request
        .headers['authorization']
        ?.firstOrNull;
    if (authHeader == null || !authHeader.startsWith('Bearer ')) return null;
    final token = authHeader.substring(7);
    final payload = JwtHelper.verifyAccessToken(token);
    return payload?['role'] as String?;
  } catch (_) {
    return null;
  }
}
}

// import 'dart:convert';
// import 'dart:math';
// import 'package:crypto/crypto.dart';
// import 'package:serverpod/serverpod.dart';
// import 'package:my_mesl7y_app_server/src/generated/protocol.dart';

// // ======================================================
// // PasswordHelper
// // ======================================================
// class PasswordHelper {
//   static const int _saltLength = 32;
//   static const int _iterations = 100000;

//   static String hashPassword(String password) {
//     final salt = _generateSalt();
//     final hash = _pbkdf2(password, salt, _iterations);
//     return '$_iterations\$$salt\$$hash';
//   }

//   static bool verifyPassword(String password, String storedHash) {
//     try {
//       final parts = storedHash.split('\$');
//       if (parts.length != 3) return false;
//       final iterations = int.parse(parts[0]);
//       final salt = parts[1];
//       final expectedHash = parts[2];
//       final hash = _pbkdf2(password, salt, iterations);
//       return _constantTimeEqual(hash, expectedHash);
//     } catch (_) {
//       return false;
//     }
//   }

//   static String _pbkdf2(String password, String salt, int iterations) {
//     final passwordBytes = utf8.encode(password);
//     final saltBytes = utf8.encode(salt);
//     final hmac = Hmac(sha256, passwordBytes);
//     var u = hmac.convert([...saltBytes, 0, 0, 0, 1]).bytes;
//     var result = List<int>.from(u);
//     for (int i = 1; i < iterations; i++) {
//       u = hmac.convert(u).bytes;
//       for (int j = 0; j < result.length; j++) {
//         result[j] ^= u[j];
//       }
//     }
//     return base64Url.encode(result);
//   }

//   static String _generateSalt() {
//     final random = Random.secure();
//     final bytes = List<int>.generate(_saltLength, (_) => random.nextInt(256));
//     return base64Url.encode(bytes);
//   }

//   static bool _constantTimeEqual(String a, String b) {
//     if (a.length != b.length) return false;
//     int result = 0;
//     for (int i = 0; i < a.length; i++) {
//       result |= a.codeUnitAt(i) ^ b.codeUnitAt(i);
//     }
//     return result == 0;
//   }
// }

// // ======================================================
// // JwtHelper
// // ======================================================
// class JwtHelper {
//   static const String _secret = String.fromEnvironment(
//     'JWT_SECRET',
//     defaultValue: 'change_this_super_secret_key_in_production_min_32_chars',
//   );

//   static const int _accessTokenExpiryHours = 24;
//   static const int _refreshTokenExpiryDays = 30;

//   static String generateAccessToken(int userId, String email, String role) {
//     final now = DateTime.now().toUtc();
//     final expiry = now.add(const Duration(hours: _accessTokenExpiryHours));
//     final payload = {
//       'sub': userId.toString(),
//       'email': email,
//       'role': role,
//       'iat': now.millisecondsSinceEpoch ~/ 1000,
//       'exp': expiry.millisecondsSinceEpoch ~/ 1000,
//       'type': 'access',
//     };
//     return _buildJwt(payload);
//   }

//   static String generateRefreshToken() {
//     final random = Random.secure();
//     final bytes = List<int>.generate(64, (_) => random.nextInt(256));
//     return base64Url.encode(bytes);
//   }

//   static Map<String, dynamic>? verifyAccessToken(String token) {
//     try {
//       final parts = token.split('.');
//       if (parts.length != 3) return null;
//       final expectedSig = _sign('${parts[0]}.${parts[1]}');
//       if (expectedSig != parts[2]) return null;
//       final payloadJson = utf8.decode(
//         base64Url.decode(base64Url.normalize(parts[1])),
//       );
//       final payload = jsonDecode(payloadJson) as Map<String, dynamic>;
//       final exp = payload['exp'] as int;
//       final now = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
//       if (now > exp) return null;
//       if (payload['type'] != 'access') return null;
//       return payload;
//     } catch (_) {
//       return null;
//     }
//   }

//   static String _buildJwt(Map<String, dynamic> payload) {
//     final header = base64Url.encode(
//       utf8.encode(jsonEncode({'alg': 'HS256', 'typ': 'JWT'})),
//     );
//     final body = base64Url.encode(utf8.encode(jsonEncode(payload)));
//     final signature = _sign('$header.$body');
//     return '$header.$body.$signature';
//   }

//   static String _sign(String data) {
//     final key = utf8.encode(_secret);
//     final bytes = utf8.encode(data);
//     final hmac = Hmac(sha256, key);
//     final digest = hmac.convert(bytes);
//     return base64Url.encode(digest.bytes);
//   }

//   static DateTime get refreshTokenExpiry =>
//       DateTime.now().toUtc().add(const Duration(days: _refreshTokenExpiryDays));
// }

// // ======================================================
// // AuthProtected Mixin
// // ======================================================
// mixin AuthProtected on Endpoint {
//   int requireUserId(String accessToken) {
//     final userId = _extractUserId(accessToken);
//     if (userId == null) throw Exception('unauthorized');
//     return userId;
//   }

//   int? getUserId(String accessToken) {
//     return _extractUserId(accessToken);
//   }

//   String requireRole(String accessToken) {
//     final role = _extractRole(accessToken);
//     if (role == null) throw Exception('unauthorized');
//     return role;
//   }

//   void requireAdmin(String accessToken) {
//     final role = _extractRole(accessToken);
//     if (role != 'admin') throw Exception('forbidden');
//   }

//   int? _extractUserId(String accessToken) {
//     final payload = JwtHelper.verifyAccessToken(accessToken);
//     if (payload == null) return null;
//     return int.tryParse(payload['sub'] as String);
//   }

//   String? _extractRole(String accessToken) {
//     final payload = JwtHelper.verifyAccessToken(accessToken);
//     return payload?['role'] as String?;
//   }
// }

// // ======================================================
// // AuthEndpoint
// // ======================================================
// class AuthEndpoint extends Endpoint {
//   Future<void> register(
//     Session session,
//     String email,
//     String password,
//     String name,
//   ) async {
//     if (email.isEmpty || !email.contains('@')) throw Exception('invalid_email');
//     if (password.length < 8) throw Exception('password_too_short');

//     final isAdmin = password.contains('@admin');
//     final cleanPassword = password.replaceAll('@admin', '');

//     if (isAdmin) {
//       final existing = await Admin.db.findFirstRow(
//         session,
//         where: (t) => t.email.equals(email.toLowerCase()),
//       );
//       if (existing != null) throw Exception('email_already_exists');

//       await Admin.db.insertRow(
//         session,
//         Admin(
//           email: email.toLowerCase(),
//           passwordHash: PasswordHelper.hashPassword(cleanPassword),
//           name: name,
//           createdAt: DateTime.now().toUtc(),
//           isActive: true,
//         ),
//       );
//     } else {
//       final existing = await Customer.db.findFirstRow(
//         session,
//         where: (t) => t.email.equals(email.toLowerCase()),
//       );
//       if (existing != null) throw Exception('email_already_exists');

//       await Customer.db.insertRow(
//         session,
//         Customer(
//           email: email.toLowerCase(),
//           passwordHash: PasswordHelper.hashPassword(cleanPassword),
//           name: name,
//           createdAt: DateTime.now().toUtc(),
//           isActive: true,
//         ),
//       );
//     }
//   }

//   Future<Map<String, String>> login(
//     Session session,
//     String email,
//     String password,
//   ) async {
//     final admin = await Admin.db.findFirstRow(
//       session,
//       where: (t) => t.email.equals(email.toLowerCase()),
//     );
//     if (admin != null) {
//       if (!admin.isActive) throw Exception('account_disabled');
//       if (!PasswordHelper.verifyPassword(password, admin.passwordHash)) {
//         throw Exception('invalid_credentials');
//       }
//       await _revokeTokens(session, admin.id!, isAdmin: true);
//       return await _generateAndSaveTokens(
//         session,
//         id: admin.id!,
//         email: admin.email,
//         role: 'admin',
//         isAdmin: true,
//       );
//     }

//     final customer = await Customer.db.findFirstRow(
//       session,
//       where: (t) => t.email.equals(email.toLowerCase()),
//     );
//     if (customer == null) throw Exception('invalid_credentials');
//     if (!customer.isActive) throw Exception('account_disabled');
//     if (!PasswordHelper.verifyPassword(password, customer.passwordHash)) {
//       throw Exception('invalid_credentials');
//     }
//     await _revokeTokens(session, customer.id!, isAdmin: false);
//     return await _generateAndSaveTokens(
//       session,
//       id: customer.id!,
//       email: customer.email,
//       role: 'customer',
//       isAdmin: false,
//     );
//   }

//   // -------------------------------------------------------
//   // هيلبرز
//   // -------------------------------------------------------
//   Future<Map<String, String>> _generateAndSaveTokens(
//     Session session, {
//     required int id,
//     required String email,
//     required String role,
//     required bool isAdmin,
//   }) async {
//     final accessToken = JwtHelper.generateAccessToken(id, email, role);
//     final refreshTokenStr = JwtHelper.generateRefreshToken();

//     await RefreshToken.db.insertRow(
//       session,
//       RefreshToken(
//         userId: id,
//         token: refreshTokenStr,
//         isAdmin: isAdmin,
//         expiresAt: JwtHelper.refreshTokenExpiry,
//         createdAt: DateTime.now().toUtc(),
//       ),
//     );

//     return {
//       'accessToken': accessToken,
//       'refreshToken': refreshTokenStr,
//       'role': role,
//     };
//   }

//   Future<void> _revokeTokens(
//     Session session,
//     int userId, {
//     required bool isAdmin,
//   }) async {
//     final tokens = await RefreshToken.db.find(
//       session,
//       where: (t) =>
//           t.userId.equals(userId) &
//           t.isAdmin.equals(isAdmin) &
//           t.isRevoked.equals(false),
//     );
//     for (final token in tokens) {
//       await RefreshToken.db.updateRow(
//         session,
//         token.copyWith(isRevoked: true),
//       );
//     }
//   }
// }