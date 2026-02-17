import 'dart:typed_data';

class ImageEntity {
  final String id;
  final String base64String;
  final double aspectRatio;
  final Uint8List bytes;

  ImageEntity({
    required this.id,
    required this.base64String,
    required this.aspectRatio,
    required this.bytes,
  });
}
