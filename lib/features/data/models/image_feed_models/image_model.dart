import 'dart:typed_data';

class ImageModel {
  final String id;
  final String base64String; // 👈 rename to avoid collision
  final double aspectRatio;
  final Uint8List bytes;

  ImageModel({
    required this.id,
    required this.base64String,
    required this.aspectRatio,
    required this.bytes,
  });

  Map<String, dynamic> toJson() {
    return {'id': id, 'base64': base64String, 'aspectRatio': aspectRatio};
  }

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      base64String: json['base64'],
      aspectRatio: json['aspectRatio'],
      bytes: Uint8List(0), // will decode in repo
    );
  }
}
