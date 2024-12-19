import 'package:ostello/features/streaming/data/models/image_model.dart';
import 'package:ostello/features/streaming/domain/entities/student_entity.dart';

class StudentModel extends StudentEntity {
  StudentModel({required super.id, required super.name, required super.avatar});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: ImageModel.fromJson(json["avatar"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
    };
  }
}
