/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class RefreshToken
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  RefreshToken._({
    this.id,
    required this.userId,
    required this.token,
    bool? isAdmin,
    required this.expiresAt,
    required this.createdAt,
    bool? isRevoked,
  })  : isAdmin = isAdmin ?? false,
        isRevoked = isRevoked ?? false;

  factory RefreshToken({
    int? id,
    required int userId,
    required String token,
    bool? isAdmin,
    required DateTime expiresAt,
    required DateTime createdAt,
    bool? isRevoked,
  }) = _RefreshTokenImpl;

  factory RefreshToken.fromJson(Map<String, dynamic> jsonSerialization) {
    return RefreshToken(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      token: jsonSerialization['token'] as String,
      isAdmin: jsonSerialization['isAdmin'] as bool,
      expiresAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      isRevoked: jsonSerialization['isRevoked'] as bool,
    );
  }

  static final t = RefreshTokenTable();

  static const db = RefreshTokenRepository._();

  @override
  int? id;

  int userId;

  String token;

  bool isAdmin;

  DateTime expiresAt;

  DateTime createdAt;

  bool isRevoked;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [RefreshToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RefreshToken copyWith({
    int? id,
    int? userId,
    String? token,
    bool? isAdmin,
    DateTime? expiresAt,
    DateTime? createdAt,
    bool? isRevoked,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'token': token,
      'isAdmin': isAdmin,
      'expiresAt': expiresAt.toJson(),
      'createdAt': createdAt.toJson(),
      'isRevoked': isRevoked,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'token': token,
      'isAdmin': isAdmin,
      'expiresAt': expiresAt.toJson(),
      'createdAt': createdAt.toJson(),
      'isRevoked': isRevoked,
    };
  }

  static RefreshTokenInclude include() {
    return RefreshTokenInclude._();
  }

  static RefreshTokenIncludeList includeList({
    _i1.WhereExpressionBuilder<RefreshTokenTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RefreshTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RefreshTokenTable>? orderByList,
    RefreshTokenInclude? include,
  }) {
    return RefreshTokenIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(RefreshToken.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(RefreshToken.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RefreshTokenImpl extends RefreshToken {
  _RefreshTokenImpl({
    int? id,
    required int userId,
    required String token,
    bool? isAdmin,
    required DateTime expiresAt,
    required DateTime createdAt,
    bool? isRevoked,
  }) : super._(
          id: id,
          userId: userId,
          token: token,
          isAdmin: isAdmin,
          expiresAt: expiresAt,
          createdAt: createdAt,
          isRevoked: isRevoked,
        );

  /// Returns a shallow copy of this [RefreshToken]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RefreshToken copyWith({
    Object? id = _Undefined,
    int? userId,
    String? token,
    bool? isAdmin,
    DateTime? expiresAt,
    DateTime? createdAt,
    bool? isRevoked,
  }) {
    return RefreshToken(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      token: token ?? this.token,
      isAdmin: isAdmin ?? this.isAdmin,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
      isRevoked: isRevoked ?? this.isRevoked,
    );
  }
}

class RefreshTokenTable extends _i1.Table<int?> {
  RefreshTokenTable({super.tableRelation})
      : super(tableName: 'refresh_tokens') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    token = _i1.ColumnString(
      'token',
      this,
    );
    isAdmin = _i1.ColumnBool(
      'isAdmin',
      this,
      hasDefault: true,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    isRevoked = _i1.ColumnBool(
      'isRevoked',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString token;

  late final _i1.ColumnBool isAdmin;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnBool isRevoked;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        token,
        isAdmin,
        expiresAt,
        createdAt,
        isRevoked,
      ];
}

class RefreshTokenInclude extends _i1.IncludeObject {
  RefreshTokenInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => RefreshToken.t;
}

class RefreshTokenIncludeList extends _i1.IncludeList {
  RefreshTokenIncludeList._({
    _i1.WhereExpressionBuilder<RefreshTokenTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(RefreshToken.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => RefreshToken.t;
}

class RefreshTokenRepository {
  const RefreshTokenRepository._();

  /// Returns a list of [RefreshToken]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<RefreshToken>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RefreshTokenTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RefreshTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RefreshTokenTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<RefreshToken>(
      where: where?.call(RefreshToken.t),
      orderBy: orderBy?.call(RefreshToken.t),
      orderByList: orderByList?.call(RefreshToken.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [RefreshToken] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<RefreshToken?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RefreshTokenTable>? where,
    int? offset,
    _i1.OrderByBuilder<RefreshTokenTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RefreshTokenTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<RefreshToken>(
      where: where?.call(RefreshToken.t),
      orderBy: orderBy?.call(RefreshToken.t),
      orderByList: orderByList?.call(RefreshToken.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [RefreshToken] by its [id] or null if no such row exists.
  Future<RefreshToken?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<RefreshToken>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [RefreshToken]s in the list and returns the inserted rows.
  ///
  /// The returned [RefreshToken]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<RefreshToken>> insert(
    _i1.Session session,
    List<RefreshToken> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<RefreshToken>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [RefreshToken] and returns the inserted row.
  ///
  /// The returned [RefreshToken] will have its `id` field set.
  Future<RefreshToken> insertRow(
    _i1.Session session,
    RefreshToken row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<RefreshToken>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [RefreshToken]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<RefreshToken>> update(
    _i1.Session session,
    List<RefreshToken> rows, {
    _i1.ColumnSelections<RefreshTokenTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<RefreshToken>(
      rows,
      columns: columns?.call(RefreshToken.t),
      transaction: transaction,
    );
  }

  /// Updates a single [RefreshToken]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<RefreshToken> updateRow(
    _i1.Session session,
    RefreshToken row, {
    _i1.ColumnSelections<RefreshTokenTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<RefreshToken>(
      row,
      columns: columns?.call(RefreshToken.t),
      transaction: transaction,
    );
  }

  /// Deletes all [RefreshToken]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<RefreshToken>> delete(
    _i1.Session session,
    List<RefreshToken> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<RefreshToken>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [RefreshToken].
  Future<RefreshToken> deleteRow(
    _i1.Session session,
    RefreshToken row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<RefreshToken>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<RefreshToken>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RefreshTokenTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<RefreshToken>(
      where: where(RefreshToken.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RefreshTokenTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<RefreshToken>(
      where: where?.call(RefreshToken.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
