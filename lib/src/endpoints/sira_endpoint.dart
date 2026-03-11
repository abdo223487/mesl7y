import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class SiraEndpoint extends Endpoint {

  // إضافة عناصر جديدة
  Future<void> addSira(Session session, List<String> siraContents) async {
    for (var content in siraContents) {
      var sira = Sira(content: content);
      await Sira.db.insertRow(session, sira);
    }
  }

  // تعديل عنصر موجود حسب الـ id (اختياري لكل field)
  Future<void> updateSira(
    Session session,
    int id, {
    String? content,
  }) async {
    var sira = await Sira.db.findById(session, id);

    if (sira == null) {
      throw Exception('Sira not found');
    }

    if (content != null) {
      sira.content = content;
    }

    await Sira.db.updateRow(session, sira);
  }

  // مسح عنصر حسب الـ id
  Future<void> deleteSira(Session session, int id) async {
    var sira = await Sira.db.findById(session, id);

    if (sira == null) {
      throw Exception('Sira not found');
    }

    await Sira.db.deleteRow(session, sira);
  }

  // استرجاع كل عناصر السيرة
  Future<List<Sira>> getAllSira(Session session) async {
    return await Sira.db.find(session);
  }
}

