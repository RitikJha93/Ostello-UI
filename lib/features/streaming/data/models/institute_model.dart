import 'package:ostello/features/streaming/data/models/image_model.dart';
import 'package:ostello/features/streaming/domain/entities/institute_entity.dart';

class InstituteModel extends InstituteEntity {
  InstituteModel(
      {required super.id, required super.name, required super.avatar});

  factory InstituteModel.fromJson(Map<String, dynamic> json) {
    return InstituteModel(
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
