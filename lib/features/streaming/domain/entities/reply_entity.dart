class ReplyEntity {
  String id;
  String senderName;
  String replyText;
  dynamic replyImage;
  dynamic replyAudio;
  String ownerId;
  DateTime createdAt;
  DateTime updatedAt;

  ReplyEntity({
    required this.id,
    required this.senderName,
    required this.replyText,
    required this.replyImage,
    required this.replyAudio,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
  });
}
