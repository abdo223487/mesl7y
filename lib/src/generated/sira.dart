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

abstract class Sira implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Sira._({
    this.id,
    required this.content,
  });

  factory Sira({
    int? id,
    required String content,
  }) = _SiraImpl;

  factory Sira.fromJson(Map<String, dynamic> jsonSerialization) {
    return Sira(
      id: jsonSerialization['id'] as int?,
      content: jsonSerialization['content'] as String,
    );
  }

  static final t = SiraTable();

  static const db = SiraRepository._();

  @override
  int? id;

  String content;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Sira]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Sira copyWith({
    int? id,
    String? content,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'content': content,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'content': content,
    };
  }

  static SiraInclude include() {
    return SiraInclude._();
  }

  static SiraIncludeList includeList({
    _i1.WhereExpressionBuilder<SiraTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SiraTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SiraTable>? orderByList,
    SiraInclude? include,
  }) {
    return SiraIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Sira.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Sira.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SiraImpl extends Sira {
  _SiraImpl({
    int? id,
    required String content,
  }) : super._(
          id: id,
          content: content,
        );

  /// Returns a shallow copy of this [Sira]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Sira copyWith({
    Object? id = _Undefined,
    String? content,
  }) {
    return Sira(
      id: id is int? ? id : this.id,
      content: content ?? this.content,
    );
  }
}

class SiraTable extends _i1.Table<int?> {
  SiraTable({super.tableRelation}) : super(tableName: 'sira') {
    content = _i1.ColumnString(
      'content',
      this,
    );
  }

  late final _i1.ColumnString content;

  @override
  List<_i1.Column> get columns => [
        id,
        content,
      ];
}

class SiraInclude extends _i1.IncludeObject {
  SiraInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Sira.t;
}

class SiraIncludeList extends _i1.IncludeList {
  SiraIncludeList._({
    _i1.WhereExpressionBuilder<SiraTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Sira.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Sira.t;
}

class SiraRepository {
  const SiraRepository._();

  /// Returns a list of [Sira]s matching the given query parameters.
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
  Future<List<Sira>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SiraTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SiraTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SiraTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Sira>(
      where: where?.call(Sira.t),
      orderBy: orderBy?.call(Sira.t),
      orderByList: orderByList?.call(Sira.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Sira] matching the given query parameters.
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
  Future<Sira?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SiraTable>? where,
    int? offset,
    _i1.OrderByBuilder<SiraTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SiraTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Sira>(
      where: where?.call(Sira.t),
      orderBy: orderBy?.call(Sira.t),
      orderByList: orderByList?.call(Sira.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Sira] by its [id] or null if no such row exists.
  Future<Sira?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Sira>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Sira]s in the list and returns the inserted rows.
  ///
  /// The returned [Sira]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Sira>> insert(
    _i1.Session session,
    List<Sira> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Sira>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Sira] and returns the inserted row.
  ///
  /// The returned [Sira] will have its `id` field set.
  Future<Sira> insertRow(
    _i1.Session session,
    Sira row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Sira>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Sira]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Sira>> update(
    _i1.Session session,
    List<Sira> rows, {
    _i1.ColumnSelections<SiraTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Sira>(
      rows,
      columns: columns?.call(Sira.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Sira]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Sira> updateRow(
    _i1.Session session,
    Sira row, {
    _i1.ColumnSelections<SiraTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Sira>(
      row,
      columns: columns?.call(Sira.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Sira]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Sira>> delete(
    _i1.Session session,
    List<Sira> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Sira>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Sira].
  Future<Sira> deleteRow(
    _i1.Session session,
    Sira row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Sira>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Sira>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SiraTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Sira>(
      where: where(Sira.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SiraTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Sira>(
      where: where?.call(Sira.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
