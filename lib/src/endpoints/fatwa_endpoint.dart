import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class FatwaEndpoint extends Endpoint {

  Future<void> addFatwa(Session session, String title, String content) async {
    var fatwa = Fatwa(
      title: title,
      content: content,
    );

    await Fatwa.db.insertRow(session, fatwa);
  }

  // Pagination
  Future<List<Fatwa>> getFatwas(
    Session session, {
    int limit = 10,
    int offset = 0,
  }) async {
    return await Fatwa.db.find(
      session,
      limit: limit,
      offset: offset,
      orderBy: (t) => t.id,
      orderDescending: true,
    );
  }

  Future<void> updateFatwa(
    Session session,
    int id, {
    String? title,
    String? content,
  }) async {

    var fatwa = await Fatwa.db.findById(session, id);

    if (fatwa == null) {
      throw Exception('Fatwa not found');
    }

    // عدل بس اللي اتبعت
    if (title != null) {
      fatwa.title = title;
    }

    if (content != null) {
      fatwa.content = content;
    }

    await Fatwa.db.updateRow(session, fatwa);
  }

  Future<void> deleteFatwa(Session session, int id) async {
    var fatwa = await Fatwa.db.findById(session, id);

    if (fatwa == null) {
      throw Exception('Fatwa not found');
    }

    await Fatwa.db.deleteRow(session, fatwa);
  }
}