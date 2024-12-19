import 'package:ostello/features/streaming/domain/entities/image_entity.dart';

class OnlineLectureEntity {
    String id;
    String name;
    ImageEntity thumbnail;

    OnlineLectureEntity({
        required this.id,
        required this.name,
        required this.thumbnail,
    });

}