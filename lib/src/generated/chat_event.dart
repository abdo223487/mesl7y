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

abstract class ChatEvent
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ChatEvent._({
    required this.type,
    required this.conversationId,
    required this.senderId,
    required this.senderRole,
    required this.message,
    required this.sentAt,
  });

  factory ChatEvent({
    required String type,
    required int conversationId,
    required int senderId,
    required String senderRole,
    required String message,
    required String sentAt,
  }) = _ChatEventImpl;

  factory ChatEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return ChatEvent(
      type: jsonSerialization['type'] as String,
      conversationId: jsonSerialization['conversationId'] as int,
      senderId: jsonSerialization['senderId'] as int,
      senderRole: jsonSerialization['senderRole'] as String,
      message: jsonSerialization['message'] as String,
      sentAt: jsonSerialization['sentAt'] as String,
    );
  }

  String type;

  int conversationId;

  int senderId;

  String senderRole;

  String message;

  String sentAt;

  /// Returns a shallow copy of this [ChatEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ChatEvent copyWith({
    String? type,
    int? conversationId,
    int? senderId,
    String? senderRole,
    String? message,
    String? sentAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'conversationId': conversationId,
      'senderId': senderId,
      'senderRole': senderRole,
      'message': message,
      'sentAt': sentAt,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'type': type,
      'conversationId': conversationId,
      'senderId': senderId,
      'senderRole': senderRole,
      'message': message,
      'sentAt': sentAt,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ChatEventImpl extends ChatEvent {
  _ChatEventImpl({
    required String type,
    required int conversationId,
    required int senderId,
    required String senderRole,
    required String message,
    required String sentAt,
  }) : super._(
          type: type,
          conversationId: conversationId,
          senderId: senderId,
          senderRole: senderRole,
          message: message,
          sentAt: sentAt,
        );

  /// Returns a shallow copy of this [ChatEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ChatEvent copyWith({
    String? type,
    int? conversationId,
    int? senderId,
    String? senderRole,
    String? message,
    String? sentAt,
  }) {
    return ChatEvent(
      type: type ?? this.type,
      conversationId: conversationId ?? this.conversationId,
      senderId: senderId ?? this.senderId,
      senderRole: senderRole ?? this.senderRole,
      message: message ?? this.message,
      sentAt: sentAt ?? this.sentAt,
    );
  }
}
