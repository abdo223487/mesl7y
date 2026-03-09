import 'dart:io';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_swagger/serverpod_swagger.dart';
import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';
import 'package:my_mesl7y_app_server/src/web/routes/root.dart';
import 'src/endpoints/auth_endpoint.dart'; // ← زود ده

void run(List<String> args) async {
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    // ← زود ده
    authenticationHandler: (Session session, String token) async {
      final payload = JwtHelper.verifyAccessToken(token);
      if (payload == null) return null;
      final userId = int.tryParse(payload['sub'] as String);
      if (userId == null) return null;
      final role = payload['role'] as String;
      final scope = role == 'admin' ? Scope('admin') : Scope('customer');
      return AuthenticationInfo(userId, {scope});
    },
  );

  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');

  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  pod.webServer.addRoute(
    SwaggerUIRoute(Directory('web')),
    '/swagger/*',
  );

  await pod.start();
}