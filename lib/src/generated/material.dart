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

abstract class MaterialFile
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  MaterialFile._({
    this.id,
    required this.yearName,
    required this.materialName,
    required this.fileUrl,
    required this.fileType,
  });

  factory MaterialFile({
    int? id,
    required String yearName,
    required String materialName,
    required String fileUrl,
    required String fileType,
  }) = _MaterialFileImpl;

  factory MaterialFile.fromJson(Map<String, dynamic> jsonSerialization) {
    return MaterialFile(
      id: jsonSerialization['id'] as int?,
      yearName: jsonSerialization['yearName'] as String,
      materialName: jsonSerialization['materialName'] as String,
      fileUrl: jsonSerialization['fileUrl'] as String,
      fileType: jsonSerialization['fileType'] as String,
    );
  }

  static final t = MaterialFileTable();

  static const db = MaterialFileRepository._();

  @override
  int? id;

  String yearName;

  String materialName;

  String fileUrl;

  String fileType;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [MaterialFile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MaterialFile copyWith({
    int? id,
    String? yearName,
    String? materialName,
    String? fileUrl,
    String? fileType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'yearName': yearName,
      'materialName': materialName,
      'fileUrl': fileUrl,
      'fileType': fileType,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'yearName': yearName,
      'materialName': materialName,
      'fileUrl': fileUrl,
      'fileType': fileType,
    };
  }

  static MaterialFileInclude include() {
    return MaterialFileInclude._();
  }

  static MaterialFileIncludeList includeList({
    _i1.WhereExpressionBuilder<MaterialFileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MaterialFileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MaterialFileTable>? orderByList,
    MaterialFileInclude? include,
  }) {
    return MaterialFileIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MaterialFile.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MaterialFile.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MaterialFileImpl extends MaterialFile {
  _MaterialFileImpl({
    int? id,
    required String yearName,
    required String materialName,
    required String fileUrl,
    required String fileType,
  }) : super._(
          id: id,
          yearName: yearName,
          materialName: materialName,
          fileUrl: fileUrl,
          fileType: fileType,
        );

  /// Returns a shallow copy of this [MaterialFile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MaterialFile copyWith({
    Object? id = _Undefined,
    String? yearName,
    String? materialName,
    String? fileUrl,
    String? fileType,
  }) {
    return MaterialFile(
      id: id is int? ? id : this.id,
      yearName: yearName ?? this.yearName,
      materialName: materialName ?? this.materialName,
      fileUrl: fileUrl ?? this.fileUrl,
      fileType: fileType ?? this.fileType,
    );
  }
}

class MaterialFileTable extends _i1.Table<int?> {
  MaterialFileTable({super.tableRelation})
      : super(tableName: 'material_files') {
    yearName = _i1.ColumnString(
      'yearName',
      this,
    );
    materialName = _i1.ColumnString(
      'materialName',
      this,
    );
    fileUrl = _i1.ColumnString(
      'fileUrl',
      this,
    );
    fileType = _i1.ColumnString(
      'fileType',
      this,
    );
  }

  late final _i1.ColumnString yearName;

  late final _i1.ColumnString materialName;

  late final _i1.ColumnString fileUrl;

  late final _i1.ColumnString fileType;

  @override
  List<_i1.Column> get columns => [
        id,
        yearName,
        materialName,
        fileUrl,
        fileType,
      ];
}

class MaterialFileInclude extends _i1.IncludeObject {
  MaterialFileInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => MaterialFile.t;
}

class MaterialFileIncludeList extends _i1.IncludeList {
  MaterialFileIncludeList._({
    _i1.WhereExpressionBuilder<MaterialFileTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MaterialFile.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MaterialFile.t;
}

class MaterialFileRepository {
  const MaterialFileRepository._();

  /// Returns a list of [MaterialFile]s matching the given query parameters.
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
  Future<List<MaterialFile>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MaterialFileTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MaterialFileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MaterialFileTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<MaterialFile>(
      where: where?.call(MaterialFile.t),
      orderBy: orderBy?.call(MaterialFile.t),
      orderByList: orderByList?.call(MaterialFile.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [MaterialFile] matching the given query parameters.
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
  Future<MaterialFile?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MaterialFileTable>? where,
    int? offset,
    _i1.OrderByBuilder<MaterialFileTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MaterialFileTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<MaterialFile>(
      where: where?.call(MaterialFile.t),
      orderBy: orderBy?.call(MaterialFile.t),
      orderByList: orderByList?.call(MaterialFile.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [MaterialFile] by its [id] or null if no such row exists.
  Future<MaterialFile?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<MaterialFile>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [MaterialFile]s in the list and returns the inserted rows.
  ///
  /// The returned [MaterialFile]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MaterialFile>> insert(
    _i1.Session session,
    List<MaterialFile> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MaterialFile>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MaterialFile] and returns the inserted row.
  ///
  /// The returned [MaterialFile] will have its `id` field set.
  Future<MaterialFile> insertRow(
    _i1.Session session,
    MaterialFile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MaterialFile>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MaterialFile]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MaterialFile>> update(
    _i1.Session session,
    List<MaterialFile> rows, {
    _i1.ColumnSelections<MaterialFileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MaterialFile>(
      rows,
      columns: columns?.call(MaterialFile.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MaterialFile]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MaterialFile> updateRow(
    _i1.Session session,
    MaterialFile row, {
    _i1.ColumnSelections<MaterialFileTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MaterialFile>(
      row,
      columns: columns?.call(MaterialFile.t),
      transaction: transaction,
    );
  }

  /// Deletes all [MaterialFile]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MaterialFile>> delete(
    _i1.Session session,
    List<MaterialFile> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MaterialFile>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MaterialFile].
  Future<MaterialFile> deleteRow(
    _i1.Session session,
    MaterialFile row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MaterialFile>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MaterialFile>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MaterialFileTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MaterialFile>(
      where: where(MaterialFile.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MaterialFileTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MaterialFile>(
      where: where?.call(MaterialFile.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
