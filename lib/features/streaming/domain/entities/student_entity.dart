import 'package:ostello/features/streaming/domain/entities/image_entity.dart';

class StudentEntity {
  String? id;
  String? name;
  ImageEntity? avatar;

  StudentEntity({
    required this.id,
    required this.name,
    required this.avatar,
  });
}
