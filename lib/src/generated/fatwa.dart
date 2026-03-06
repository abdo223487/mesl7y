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

abstract class Fatwa implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Fatwa._({
    this.id,
    required this.title,
    required this.content,
  });

  factory Fatwa({
    int? id,
    required String title,
    required String content,
  }) = _FatwaImpl;

  factory Fatwa.fromJson(Map<String, dynamic> jsonSerialization) {
    return Fatwa(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
    );
  }

  static final t = FatwaTable();

  static const db = FatwaRepository._();

  @override
  int? id;

  String title;

  String content;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Fatwa]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Fatwa copyWith({
    int? id,
    String? title,
    String? content,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'content': content,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'content': content,
    };
  }

  static FatwaInclude include() {
    return FatwaInclude._();
  }

  static FatwaIncludeList includeList({
    _i1.WhereExpressionBuilder<FatwaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FatwaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FatwaTable>? orderByList,
    FatwaInclude? include,
  }) {
    return FatwaIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Fatwa.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Fatwa.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FatwaImpl extends Fatwa {
  _FatwaImpl({
    int? id,
    required String title,
    required String content,
  }) : super._(
          id: id,
          title: title,
          content: content,
        );

  /// Returns a shallow copy of this [Fatwa]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Fatwa copyWith({
    Object? id = _Undefined,
    String? title,
    String? content,
  }) {
    return Fatwa(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }
}

class FatwaTable extends _i1.Table<int?> {
  FatwaTable({super.tableRelation}) : super(tableName: 'fatwa') {
    title = _i1.ColumnString(
      'title',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
  }

  late final _i1.ColumnString title;

  late final _i1.ColumnString content;

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        content,
      ];
}

class FatwaInclude extends _i1.IncludeObject {
  FatwaInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Fatwa.t;
}

class FatwaIncludeList extends _i1.IncludeList {
  FatwaIncludeList._({
    _i1.WhereExpressionBuilder<FatwaTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Fatwa.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Fatwa.t;
}

class FatwaRepository {
  const FatwaRepository._();

  /// Returns a list of [Fatwa]s matching the given query parameters.
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
  Future<List<Fatwa>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FatwaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FatwaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FatwaTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Fatwa>(
      where: where?.call(Fatwa.t),
      orderBy: orderBy?.call(Fatwa.t),
      orderByList: orderByList?.call(Fatwa.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Fatwa] matching the given query parameters.
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
  Future<Fatwa?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FatwaTable>? where,
    int? offset,
    _i1.OrderByBuilder<FatwaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FatwaTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Fatwa>(
      where: where?.call(Fatwa.t),
      orderBy: orderBy?.call(Fatwa.t),
      orderByList: orderByList?.call(Fatwa.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Fatwa] by its [id] or null if no such row exists.
  Future<Fatwa?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Fatwa>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Fatwa]s in the list and returns the inserted rows.
  ///
  /// The returned [Fatwa]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Fatwa>> insert(
    _i1.Session session,
    List<Fatwa> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Fatwa>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Fatwa] and returns the inserted row.
  ///
  /// The returned [Fatwa] will have its `id` field set.
  Future<Fatwa> insertRow(
    _i1.Session session,
    Fatwa row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Fatwa>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Fatwa]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Fatwa>> update(
    _i1.Session session,
    List<Fatwa> rows, {
    _i1.ColumnSelections<FatwaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Fatwa>(
      rows,
      columns: columns?.call(Fatwa.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Fatwa]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Fatwa> updateRow(
    _i1.Session session,
    Fatwa row, {
    _i1.ColumnSelections<FatwaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Fatwa>(
      row,
      columns: columns?.call(Fatwa.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Fatwa]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Fatwa>> delete(
    _i1.Session session,
    List<Fatwa> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Fatwa>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Fatwa].
  Future<Fatwa> deleteRow(
    _i1.Session session,
    Fatwa row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Fatwa>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Fatwa>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FatwaTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Fatwa>(
      where: where(Fatwa.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FatwaTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Fatwa>(
      where: where?.call(Fatwa.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
