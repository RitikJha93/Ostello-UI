import 'package:ostello/features/streaming/domain/entities/image_entity.dart';

class OnlineCourseEntity {
    String id;
    String name;
    ImageEntity image;

    OnlineCourseEntity({
        required this.id,
        required this.name,
        required this.image,
    });

}
