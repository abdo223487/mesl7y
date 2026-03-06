import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class HadithEndpoint extends Endpoint {

  Future<List<Hadith>> getAll(Session session) async {
    return await Hadith.db.find(session);
  }

  Future<void> addHadith(
    Session session,
    String title,
    String text,
    String narrator,
    String source,
    String category,
  ) async {

    final hadith = Hadith(
      title: title,
      text: text,
      narrator: narrator,
      source: source,
      category: category,
    );

    await Hadith.db.insertRow(session, hadith);
  }

}