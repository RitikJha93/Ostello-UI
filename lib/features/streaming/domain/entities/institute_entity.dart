import 'package:ostello/features/streaming/domain/entities/image_entity.dart';

class InstituteEntity {
    String id;
    String name;
    ImageEntity? avatar;
    List<ImageEntity>? images;

    InstituteEntity({
        required this.id,
        required this.name,
        required this.avatar,
        this.images,
    });
}