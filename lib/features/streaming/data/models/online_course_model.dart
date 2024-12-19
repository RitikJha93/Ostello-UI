import 'package:ostello/features/streaming/data/models/image_model.dart';
import 'package:ostello/features/streaming/domain/entities/online_course_entity.dart';

class OnlineCourseModel extends OnlineCourseEntity {
  OnlineCourseModel(
      {required super.id, required super.name, required super.image});

  factory OnlineCourseModel.fromJson(Map<String, dynamic> json) {
    return OnlineCourseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: ImageModel.fromJson(json["image"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}
