import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import 'package:my_mesl7y_app_server/src/generated/protocol.dart';
import 'auth_endpoint.dart';

class ChatUserObject {
  final Map<String, void Function(dynamic)> listeners;
  ChatUserObject({required this.listeners});
}

class ChatEndpoint extends Endpoint with AuthProtected {

  Future<String> requestChat(Session session) async {
    final info = await session.authenticated;
    if (info == null) throw Exception('unauthorized');
    if (info.scopes.contains(Scope('admin'))) throw Exception('forbidden');

    final customerId = info.userId;

    final existing = await ChatConversation.db.findFirstRow(
      session,
      where: (c) =>
          c.customerId.equals(customerId) &
          (c.status.equals('pending') | c.status.equals('active')),
    );
    if (existing != null) {
      return jsonEncode({
        'conversationId': existing.id,
        'status': existing.status,
      });
    }

    final conversation = await ChatConversation.db.insertRow(
      session,
      ChatConversation(
        customerId: customerId,
        status: 'pending',
        createdAt: DateTime.now().toUtc(),
        updatedAt: DateTime.now().toUtc(),
      ),
    );

    session.messages.postMessage(
      'admin_notifications',
      ChatEvent(
        type: 'new_request',
        conversationId: conversation.id!,
        senderId: customerId,
        senderRole: 'customer',
        message: '',
        sentAt: DateTime.now().toIso8601String(),
      ),
    );

    return jsonEncode({
      'conversationId': conversation.id,
      'status': 'pending',
    });
  }

  Future<void> acceptChat(Session session, int conversationId) async {
    final info = await session.authenticated;
    if (info == null) throw Exception('unauthorized');
    if (!info.scopes.contains(Scope('admin'))) throw Exception('forbidden');

    final adminId = info.userId;

    final conversation = await ChatConversation.db.findById(
      session,
      conversationId,
    );
    if (conversation == null) throw Exception('conversation_not_found');
    if (conversation.status != 'pending') throw Exception('already_taken');

    await ChatConversation.db.updateRow(
      session,
      conversation.copyWith(
        adminId: adminId,
        status: 'active',
        updatedAt: DateTime.now().toUtc(),
      ),
    );

    session.messages.postMessage(
      'admin_notifications',
      ChatEvent(
        type: 'request_taken',
        conversationId: conversationId,
        senderId: adminId,
        senderRole: 'admin',
        message: '',
        sentAt: DateTime.now().toIso8601String(),
      ),
    );

    session.messages.postMessage(
      'customer_${conversation.customerId}',
      ChatEvent(
        type: 'chat_accepted',
        conversationId: conversationId,
        senderId: adminId,
        senderRole: 'admin',
        message: '',
        sentAt: DateTime.now().toIso8601String(),
      ),
    );
  }

  Future<void> sendMessage(
    Session session,
    int conversationId,
    String message,
  ) async {
    final info = await session.authenticated;
    if (info == null) throw Exception('unauthorized');

    final senderId = info.userId;
    final isAdmin = info.scopes.contains(Scope('admin'));
    final senderRole = isAdmin ? 'admin' : 'customer';

    final conversation = await ChatConversation.db.findById(
      session,
      conversationId,
    );
    if (conversation == null) throw Exception('conversation_not_found');
    if (conversation.status != 'active') throw Exception('conversation_not_active');

    if (!isAdmin && conversation.customerId != senderId) {
      throw Exception('forbidden');
    }
    if (isAdmin && conversation.adminId != senderId) {
      throw Exception('forbidden');
    }

    await ChatMessage.db.insertRow(
      session,
      ChatMessage(
        conversationId: conversationId,
        senderId: senderId,
        senderRole: senderRole,
        message: message,
        createdAt: DateTime.now().toUtc(),
      ),
    );

    final event = ChatEvent(
      type: 'new_message',
      conversationId: conversationId,
      senderId: senderId,
      senderRole: senderRole,
      message: message,
      sentAt: DateTime.now().toIso8601String(),
    );

    session.messages.postMessage(
      'customer_${conversation.customerId}',
      event,
    );

    if (conversation.adminId != null) {
      session.messages.postMessage(
        'admin_${conversation.adminId}',
        event,
      );
    }
  }

  Future<String> getMessages(Session session, int conversationId) async {
    final info = await session.authenticated;
    if (info == null) throw Exception('unauthorized');

    final messages = await ChatMessage.db.find(
      session,
      where: (m) => m.conversationId.equals(conversationId),
      orderBy: (m) => m.createdAt,
    );

    return jsonEncode(messages.map((m) => {
      'id': m.id,
      'senderId': m.senderId,
      'senderRole': m.senderRole,
      'message': m.message,
      'createdAt': m.createdAt.toIso8601String(),
    }).toList());
  }

  Future<String> getPendingChats(Session session) async {
    final info = await session.authenticated;
    if (info == null) throw Exception('unauthorized');
    if (!info.scopes.contains(Scope('admin'))) throw Exception('forbidden');

    final conversations = await ChatConversation.db.find(
      session,
      where: (c) => c.status.equals('pending'),
      orderBy: (c) => c.createdAt,
    );

    return jsonEncode(conversations.map((c) => {
      'conversationId': c.id,
      'customerId': c.customerId,
      'status': c.status,
      'createdAt': c.createdAt.toIso8601String(),
    }).toList());
  }

  @override
  Future<void> handleStreamMessage(
    StreamingSession session,
    SerializableModel message,
  ) async {
    if (message is ChatEvent) {
      if (message.type == 'send_message') {
        await sendMessage(session, message.conversationId, message.message);
      }
    }
  }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    final info = await session.authenticated;
    if (info == null) return;

    final userId = info.userId;
    final isAdmin = info.scopes.contains(Scope('admin'));
    final listeners = <String, void Function(dynamic)>{};

    if (isAdmin) {
      listeners['admin_notifications'] =
          (message) => sendStreamMessage(session, message);
      listeners['admin_$userId'] =
          (message) => sendStreamMessage(session, message);
    } else {
      listeners['customer_$userId'] =
          (message) => sendStreamMessage(session, message);
    }

    listeners.forEach((channel, callback) {
      session.messages.addListener(channel, callback);
    });

    setUserObject(session, ChatUserObject(listeners: listeners));
  }

  @override
  Future<void> streamClosed(StreamingSession session) async {
    final userObject = getUserObject(session) as ChatUserObject?;
    if (userObject == null) return;

    userObject.listeners.forEach((channel, callback) {
      session.messages.removeListener(channel, callback);
    });
  }
  Future<String> getMyActiveChats(Session session) async {
  final info = await session.authenticated;
  if (info == null) throw Exception('unauthorized');
  if (!info.scopes.contains(Scope('admin'))) throw Exception('forbidden');

  final adminId = info.userId;

  final conversations = await ChatConversation.db.find(
    session,
    where: (c) => c.adminId.equals(adminId) & c.status.equals('active'),
    orderBy: (c) => c.updatedAt,
  );

  return jsonEncode(conversations.map((c) => {
    'conversationId': c.id,
    'customerId': c.customerId,
    'status': c.status,
    'createdAt': c.createdAt.toIso8601String(),
  }).toList());
}


Future<String> getMyChats(Session session) async {
  final info = await session.authenticated;
  if (info == null) throw Exception('unauthorized');
  if (info.scopes.contains(Scope('admin'))) throw Exception('forbidden');

  final customerId = info.userId;

  final conversations = await ChatConversation.db.find(
    session,
    where: (c) => c.customerId.equals(customerId),
    orderBy: (c) => c.updatedAt,
  );

  return jsonEncode(conversations.map((c) => {
    'conversationId': c.id,
    'customerId': c.customerId,
    'status': c.status,
    'createdAt': c.createdAt.toIso8601String(),
  }).toList());
}



}