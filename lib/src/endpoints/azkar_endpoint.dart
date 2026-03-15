import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class AzkarEndpoint extends Endpoint {

  // ── جيب كل الأذكار حسب الكاتيجوري
  Future<List<AzkarItem>> getAzkar(
    Session session,
    String category,
  ) async {
    return await AzkarItem.db.find(
      session,
      where:   (a) => a.category.equals(category),
      orderBy: (a) => a.orderIndex,
    );
  }

  // ── أضف ذكر جديد
  Future<AzkarItem> addAzkar(
    Session session,
    String category,
    String arabicText,
    int    repeat,
    int    orderIndex,
  ) async {
    final item = AzkarItem(
      category:   category,
      arabicText: arabicText,
      repeat:     repeat,
      orderIndex: orderIndex,
    );
    return await AzkarItem.db.insertRow(session, item);
  }

  // ── تعديل
  Future<AzkarItem> updateAzkar(
    Session session,
    int     id, {
    String? arabicText,
    int?    repeat,
  }) async {
    final item = await AzkarItem.db.findById(session, id);
    if (item == null) throw Exception('Not found');
    final updated = item.copyWith(
      arabicText: arabicText ?? item.arabicText,
      repeat:     repeat     ?? item.repeat,
    );
    return await AzkarItem.db.updateRow(session, updated);
  }

  // ── حذف
  Future<void> deleteAzkar(Session session, int id) async {
    final item = await AzkarItem.db.findById(session, id);
    if (item != null) await AzkarItem.db.deleteRow(session, item);
  }
}