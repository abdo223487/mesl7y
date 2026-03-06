import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class NabiEndpoint extends Endpoint {

  // إضافة معلومات عن النبي
  Future<void> addNabi(Session session, List<String> nabiContents) async {
    for (var content in nabiContents) {
      var nabi = Nabi(content: content);
      await Nabi.db.insertRow(session, nabi);
    }
  }

  // تعديل
  Future<void> updateNabi(
    Session session,
    int id, {
    String? content,
  }) async {

    var nabi = await Nabi.db.findById(session, id);

    if (nabi == null) {
      throw Exception('Nabi content not found');
    }

    if (content != null) {
      nabi.content = content;
    }

    await Nabi.db.updateRow(session, nabi);
  }

  // حذف
  Future<void> deleteNabi(Session session, int id) async {

    var nabi = await Nabi.db.findById(session, id);

    if (nabi == null) {
      throw Exception('Nabi content not found');
    }

    await Nabi.db.deleteRow(session, nabi);
  }

  // جلب الكل
  Future<List<Nabi>> getAllNabi(Session session) async {
    return await Nabi.db.find(session);
  }
}