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

abstract class AzkarItem
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  AzkarItem._({
    this.id,
    required this.category,
    required this.arabicText,
    required this.repeat,
    required this.orderIndex,
  });

  factory AzkarItem({
    int? id,
    required String category,
    required String arabicText,
    required int repeat,
    required int orderIndex,
  }) = _AzkarItemImpl;

  factory AzkarItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return AzkarItem(
      id: jsonSerialization['id'] as int?,
      category: jsonSerialization['category'] as String,
      arabicText: jsonSerialization['arabicText'] as String,
      repeat: jsonSerialization['repeat'] as int,
      orderIndex: jsonSerialization['orderIndex'] as int,
    );
  }

  static final t = AzkarItemTable();

  static const db = AzkarItemRepository._();

  @override
  int? id;

  String category;

  String arabicText;

  int repeat;

  int orderIndex;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [AzkarItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AzkarItem copyWith({
    int? id,
    String? category,
    String? arabicText,
    int? repeat,
    int? orderIndex,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'category': category,
      'arabicText': arabicText,
      'repeat': repeat,
      'orderIndex': orderIndex,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'category': category,
      'arabicText': arabicText,
      'repeat': repeat,
      'orderIndex': orderIndex,
    };
  }

  static AzkarItemInclude include() {
    return AzkarItemInclude._();
  }

  static AzkarItemIncludeList includeList({
    _i1.WhereExpressionBuilder<AzkarItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AzkarItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AzkarItemTable>? orderByList,
    AzkarItemInclude? include,
  }) {
    return AzkarItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AzkarItem.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AzkarItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AzkarItemImpl extends AzkarItem {
  _AzkarItemImpl({
    int? id,
    required String category,
    required String arabicText,
    required int repeat,
    required int orderIndex,
  }) : super._(
          id: id,
          category: category,
          arabicText: arabicText,
          repeat: repeat,
          orderIndex: orderIndex,
        );

  /// Returns a shallow copy of this [AzkarItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AzkarItem copyWith({
    Object? id = _Undefined,
    String? category,
    String? arabicText,
    int? repeat,
    int? orderIndex,
  }) {
    return AzkarItem(
      id: id is int? ? id : this.id,
      category: category ?? this.category,
      arabicText: arabicText ?? this.arabicText,
      repeat: repeat ?? this.repeat,
      orderIndex: orderIndex ?? this.orderIndex,
    );
  }
}

class AzkarItemTable extends _i1.Table<int?> {
  AzkarItemTable({super.tableRelation}) : super(tableName: 'azkar_items') {
    category = _i1.ColumnString(
      'category',
      this,
    );
    arabicText = _i1.ColumnString(
      'arabicText',
      this,
    );
    repeat = _i1.ColumnInt(
      'repeat',
      this,
    );
    orderIndex = _i1.ColumnInt(
      'orderIndex',
      this,
    );
  }

  late final _i1.ColumnString category;

  late final _i1.ColumnString arabicText;

  late final _i1.ColumnInt repeat;

  late final _i1.ColumnInt orderIndex;

  @override
  List<_i1.Column> get columns => [
        id,
        category,
        arabicText,
        repeat,
        orderIndex,
      ];
}

class AzkarItemInclude extends _i1.IncludeObject {
  AzkarItemInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => AzkarItem.t;
}

class AzkarItemIncludeList extends _i1.IncludeList {
  AzkarItemIncludeList._({
    _i1.WhereExpressionBuilder<AzkarItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AzkarItem.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => AzkarItem.t;
}

class AzkarItemRepository {
  const AzkarItemRepository._();

  /// Returns a list of [AzkarItem]s matching the given query parameters.
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
  Future<List<AzkarItem>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AzkarItemTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AzkarItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AzkarItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<AzkarItem>(
      where: where?.call(AzkarItem.t),
      orderBy: orderBy?.call(AzkarItem.t),
      orderByList: orderByList?.call(AzkarItem.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [AzkarItem] matching the given query parameters.
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
  Future<AzkarItem?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AzkarItemTable>? where,
    int? offset,
    _i1.OrderByBuilder<AzkarItemTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AzkarItemTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<AzkarItem>(
      where: where?.call(AzkarItem.t),
      orderBy: orderBy?.call(AzkarItem.t),
      orderByList: orderByList?.call(AzkarItem.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [AzkarItem] by its [id] or null if no such row exists.
  Future<AzkarItem?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<AzkarItem>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [AzkarItem]s in the list and returns the inserted rows.
  ///
  /// The returned [AzkarItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<AzkarItem>> insert(
    _i1.Session session,
    List<AzkarItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AzkarItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [AzkarItem] and returns the inserted row.
  ///
  /// The returned [AzkarItem] will have its `id` field set.
  Future<AzkarItem> insertRow(
    _i1.Session session,
    AzkarItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AzkarItem>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AzkarItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AzkarItem>> update(
    _i1.Session session,
    List<AzkarItem> rows, {
    _i1.ColumnSelections<AzkarItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AzkarItem>(
      rows,
      columns: columns?.call(AzkarItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AzkarItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AzkarItem> updateRow(
    _i1.Session session,
    AzkarItem row, {
    _i1.ColumnSelections<AzkarItemTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AzkarItem>(
      row,
      columns: columns?.call(AzkarItem.t),
      transaction: transaction,
    );
  }

  /// Deletes all [AzkarItem]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AzkarItem>> delete(
    _i1.Session session,
    List<AzkarItem> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AzkarItem>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AzkarItem].
  Future<AzkarItem> deleteRow(
    _i1.Session session,
    AzkarItem row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AzkarItem>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AzkarItem>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AzkarItemTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AzkarItem>(
      where: where(AzkarItem.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AzkarItemTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AzkarItem>(
      where: where?.call(AzkarItem.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
