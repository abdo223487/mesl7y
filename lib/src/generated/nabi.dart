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

abstract class Nabi implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Nabi._({
    this.id,
    required this.content,
  });

  factory Nabi({
    int? id,
    required String content,
  }) = _NabiImpl;

  factory Nabi.fromJson(Map<String, dynamic> jsonSerialization) {
    return Nabi(
      id: jsonSerialization['id'] as int?,
      content: jsonSerialization['content'] as String,
    );
  }

  static final t = NabiTable();

  static const db = NabiRepository._();

  @override
  int? id;

  String content;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Nabi]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Nabi copyWith({
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

  static NabiInclude include() {
    return NabiInclude._();
  }

  static NabiIncludeList includeList({
    _i1.WhereExpressionBuilder<NabiTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NabiTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NabiTable>? orderByList,
    NabiInclude? include,
  }) {
    return NabiIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Nabi.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Nabi.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NabiImpl extends Nabi {
  _NabiImpl({
    int? id,
    required String content,
  }) : super._(
          id: id,
          content: content,
        );

  /// Returns a shallow copy of this [Nabi]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Nabi copyWith({
    Object? id = _Undefined,
    String? content,
  }) {
    return Nabi(
      id: id is int? ? id : this.id,
      content: content ?? this.content,
    );
  }
}

class NabiTable extends _i1.Table<int?> {
  NabiTable({super.tableRelation}) : super(tableName: 'nabi') {
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

class NabiInclude extends _i1.IncludeObject {
  NabiInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Nabi.t;
}

class NabiIncludeList extends _i1.IncludeList {
  NabiIncludeList._({
    _i1.WhereExpressionBuilder<NabiTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Nabi.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Nabi.t;
}

class NabiRepository {
  const NabiRepository._();

  /// Returns a list of [Nabi]s matching the given query parameters.
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
  Future<List<Nabi>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NabiTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NabiTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NabiTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Nabi>(
      where: where?.call(Nabi.t),
      orderBy: orderBy?.call(Nabi.t),
      orderByList: orderByList?.call(Nabi.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Nabi] matching the given query parameters.
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
  Future<Nabi?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NabiTable>? where,
    int? offset,
    _i1.OrderByBuilder<NabiTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NabiTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Nabi>(
      where: where?.call(Nabi.t),
      orderBy: orderBy?.call(Nabi.t),
      orderByList: orderByList?.call(Nabi.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Nabi] by its [id] or null if no such row exists.
  Future<Nabi?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Nabi>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Nabi]s in the list and returns the inserted rows.
  ///
  /// The returned [Nabi]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Nabi>> insert(
    _i1.Session session,
    List<Nabi> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Nabi>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Nabi] and returns the inserted row.
  ///
  /// The returned [Nabi] will have its `id` field set.
  Future<Nabi> insertRow(
    _i1.Session session,
    Nabi row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Nabi>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Nabi]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Nabi>> update(
    _i1.Session session,
    List<Nabi> rows, {
    _i1.ColumnSelections<NabiTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Nabi>(
      rows,
      columns: columns?.call(Nabi.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Nabi]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Nabi> updateRow(
    _i1.Session session,
    Nabi row, {
    _i1.ColumnSelections<NabiTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Nabi>(
      row,
      columns: columns?.call(Nabi.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Nabi]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Nabi>> delete(
    _i1.Session session,
    List<Nabi> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Nabi>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Nabi].
  Future<Nabi> deleteRow(
    _i1.Session session,
    Nabi row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Nabi>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Nabi>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<NabiTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Nabi>(
      where: where(Nabi.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NabiTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Nabi>(
      where: where?.call(Nabi.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
