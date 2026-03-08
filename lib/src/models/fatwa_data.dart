import 'package:serverpod/serverpod.dart';

class FatwaData extends SerializableEntity {
  String title;
  String content;

  FatwaData({
    required this.title,
    required this.content,
  });

  // من JSON object
  factory FatwaData.fromJson(Map<String, dynamic> json) {
    return FatwaData(
      title: json['title'],
      content: json['content'],
    );
  }

  // تحويل FatwaData لـ JSON
  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
    };
  }
}