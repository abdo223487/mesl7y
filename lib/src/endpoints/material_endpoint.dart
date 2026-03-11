import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class MaterialEndpoint extends Endpoint {

  // رفع ماتريال جديد
  Future<MaterialFile> uploadMaterial(
    Session session, {
    required String yearName,
    required String materialName,
    required String fileUrl,
    required String fileType,
  }) async {
    final material = MaterialFile(
      yearName: yearName,
      materialName: materialName,
      fileUrl: fileUrl,
      fileType: fileType,
    );

    await MaterialFile.db.insertRow(session, material);
    return material;
  }

  // جيب كل الماتيريالز
  Future<List<MaterialFile>> getAllMaterials(Session session) async {
    return await MaterialFile.db.find(session);
  }

  // جيب ماتيريالز بسنة معينة
  Future<List<MaterialFile>> getMaterialsByYear(
    Session session,
    String yearName,
  ) async {
    return await MaterialFile.db.find(
      session,
      where: (t) => t.yearName.equals(yearName),
    );
  }

  // جيب ماتيريالز باسم الماتريال
  Future<List<MaterialFile>> getMaterialsByName(
    Session session,
    String materialName,
  ) async {
    return await MaterialFile.db.find(
      session,
      where: (t) => t.materialName.equals(materialName),
    );
  }

  // مسح ماتريال
  Future<void> deleteMaterial(Session session, int id) async {
    await MaterialFile.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
    );
  }
}
