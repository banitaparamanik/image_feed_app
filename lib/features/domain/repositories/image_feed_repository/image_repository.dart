import 'dart:io';

import 'package:image_feed_app/features/domain/entities/image_entity.dart';

abstract class ImageRepository {
  Future<void> uploadImage(File file);
  Future<List<ImageEntity>> getImages();
}
