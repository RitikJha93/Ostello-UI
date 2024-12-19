import 'package:ostello/features/streaming/domain/entities/reply_entity.dart';

class ReplyModel extends ReplyEntity {
  ReplyModel(
      {required super.id,
      required super.senderName,
      required super.replyText,
      required super.replyImage,
      required super.replyAudio,
      required super.ownerId,
      required super.createdAt,
      required super.updatedAt});

  factory ReplyModel.fromJson(Map<String, dynamic> json) {
    return ReplyModel(
      id: json['id'] as String,
      senderName: json['sender_name'] as String,
      replyText: json['reply_text'] as String,
      replyImage: json['reply_image'] != null ? json['reply_image'] as String? : "",
      replyAudio: json['reply_audio'] != null ? json['reply_audio'] as String? : "",
      ownerId: json['owner_id'] as String,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender_name': senderName,
      'reply_text': replyText,
      'reply_image': replyImage,
      'reply_audio': replyAudio,
      'owner_id': ownerId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
