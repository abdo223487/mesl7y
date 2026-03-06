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

abstract class Hadith implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Hadith._({
    this.id,
    required this.title,
    required this.text,
    this.narrator,
    this.source,
    this.category,
  });

  factory Hadith({
    int? id,
    required String title,
    required String text,
    String? narrator,
    String? source,
    String? category,
  }) = _HadithImpl;

  factory Hadith.fromJson(Map<String, dynamic> jsonSerialization) {
    return Hadith(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      text: jsonSerialization['text'] as String,
      narrator: jsonSerialization['narrator'] as String?,
      source: jsonSerialization['source'] as String?,
      category: jsonSerialization['category'] as String?,
    );
  }

  static final t = HadithTable();

  static const db = HadithRepository._();

  @override
  int? id;

  String title;

  String text;

  String? narrator;

  String? source;

  String? category;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Hadith]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Hadith copyWith({
    int? id,
    String? title,
    String? text,
    String? narrator,
    String? source,
    String? category,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'text': text,
      if (narrator != null) 'narrator': narrator,
      if (source != null) 'source': source,
      if (category != null) 'category': category,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'text': text,
      if (narrator != null) 'narrator': narrator,
      if (source != null) 'source': source,
      if (category != null) 'category': category,
    };
  }

  static HadithInclude include() {
    return HadithInclude._();
  }

  static HadithIncludeList includeList({
    _i1.WhereExpressionBuilder<HadithTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HadithTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HadithTable>? orderByList,
    HadithInclude? include,
  }) {
    return HadithIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Hadith.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Hadith.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HadithImpl extends Hadith {
  _HadithImpl({
    int? id,
    required String title,
    required String text,
    String? narrator,
    String? source,
    String? category,
  }) : super._(
          id: id,
          title: title,
          text: text,
          narrator: narrator,
          source: source,
          category: category,
        );

  /// Returns a shallow copy of this [Hadith]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Hadith copyWith({
    Object? id = _Undefined,
    String? title,
    String? text,
    Object? narrator = _Undefined,
    Object? source = _Undefined,
    Object? category = _Undefined,
  }) {
    return Hadith(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      text: text ?? this.text,
      narrator: narrator is String? ? narrator : this.narrator,
      source: source is String? ? source : this.source,
      category: category is String? ? category : this.category,
    );
  }
}

class HadithTable extends _i1.Table<int?> {
  HadithTable({super.tableRelation}) : super(tableName: 'hadith') {
    title = _i1.ColumnString(
      'title',
      this,
    );
    text = _i1.ColumnString(
      'text',
      this,
    );
    narrator = _i1.ColumnString(
      'narrator',
      this,
    );
    source = _i1.ColumnString(
      'source',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
  }

  late final _i1.ColumnString title;

  late final _i1.ColumnString text;

  late final _i1.ColumnString narrator;

  late final _i1.ColumnString source;

  late final _i1.ColumnString category;

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        text,
        narrator,
        source,
        category,
      ];
}

class HadithInclude extends _i1.IncludeObject {
  HadithInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Hadith.t;
}

class HadithIncludeList extends _i1.IncludeList {
  HadithIncludeList._({
    _i1.WhereExpressionBuilder<HadithTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Hadith.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Hadith.t;
}

class HadithRepository {
  const HadithRepository._();

  /// Returns a list of [Hadith]s matching the given query parameters.
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
  Future<List<Hadith>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HadithTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HadithTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HadithTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Hadith>(
      where: where?.call(Hadith.t),
      orderBy: orderBy?.call(Hadith.t),
      orderByList: orderByList?.call(Hadith.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Hadith] matching the given query parameters.
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
  Future<Hadith?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HadithTable>? where,
    int? offset,
    _i1.OrderByBuilder<HadithTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HadithTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Hadith>(
      where: where?.call(Hadith.t),
      orderBy: orderBy?.call(Hadith.t),
      orderByList: orderByList?.call(Hadith.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Hadith] by its [id] or null if no such row exists.
  Future<Hadith?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Hadith>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Hadith]s in the list and returns the inserted rows.
  ///
  /// The returned [Hadith]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Hadith>> insert(
    _i1.Session session,
    List<Hadith> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Hadith>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Hadith] and returns the inserted row.
  ///
  /// The returned [Hadith] will have its `id` field set.
  Future<Hadith> insertRow(
    _i1.Session session,
    Hadith row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Hadith>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Hadith]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Hadith>> update(
    _i1.Session session,
    List<Hadith> rows, {
    _i1.ColumnSelections<HadithTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Hadith>(
      rows,
      columns: columns?.call(Hadith.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Hadith]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Hadith> updateRow(
    _i1.Session session,
    Hadith row, {
    _i1.ColumnSelections<HadithTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Hadith>(
      row,
      columns: columns?.call(Hadith.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Hadith]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Hadith>> delete(
    _i1.Session session,
    List<Hadith> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Hadith>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Hadith].
  Future<Hadith> deleteRow(
    _i1.Session session,
    Hadith row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Hadith>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Hadith>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<HadithTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Hadith>(
      where: where(Hadith.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HadithTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Hadith>(
      where: where?.call(Hadith.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
