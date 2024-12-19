import 'package:ostello/features/streaming/domain/entities/image_entity.dart';

class ImageModel extends ImageEntity {
  ImageModel({required super.url, required super.key});

  factory ImageModel.fromJson(Map<String, dynamic>? json) {
    return ImageModel(
      url: json != null ? json['url'] : "",
      key: json != null ? json['key'] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'key': key,
    };
  }
}
