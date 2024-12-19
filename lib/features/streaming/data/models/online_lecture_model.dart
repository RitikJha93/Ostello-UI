import 'package:ostello/features/streaming/data/models/image_model.dart';
import 'package:ostello/features/streaming/domain/entities/online_lecture.dart';

class OnlineLectureModel extends OnlineLectureEntity {
  OnlineLectureModel(
      {required super.id, required super.name, required super.thumbnail});

  factory OnlineLectureModel.fromJson(Map<String, dynamic> json) {
    return OnlineLectureModel(
      id: json['id'] as String,
      name: json['name'] as String,
      thumbnail: ImageModel.fromJson(json['thumbnail']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'thumbnail': thumbnail,
    };
  }
}
