import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:image_feed_app/features/data/datasource/image_datasource/image_local_datasource.dart';
import 'package:image_feed_app/features/data/models/image_feed_models/image_model.dart';
import 'package:image_feed_app/features/domain/entities/image_entity.dart';
import 'package:image_feed_app/features/domain/repositories/image_feed_repository/image_repository.dart';
import 'package:uuid/uuid.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageLocalDataSource localDataSource;

  ImageRepositoryImpl(this.localDataSource);
  @override
  @override
  Future<void> uploadImage(File file) async {
    try {
      debugPrint("STEP 1 - Reading file");

      final Uint8List bytes = await file.readAsBytes();

      debugPrint("STEP 2 - Encoding to Base64 in isolate");

      final String base64Str = await compute(_encodeToBase64Isolate, bytes);

      debugPrint("STEP 3 - Calculating aspect ratio");

      final decoded = await decodeImageFromList(bytes);
      final double ratio = decoded.width / decoded.height;

      debugPrint("STEP 4 - Creating ImageModel");

      final image = ImageModel(
        id: const Uuid().v4(),
        base64String: base64Str,
        aspectRatio: ratio,
        bytes: bytes,
      );

      debugPrint("STEP 5 - Image JSON: ${image.toJson()}");

      await localDataSource.saveImage(image);

      debugPrint("STEP 6 - Image saved successfully");
    } catch (e, s) {
      debugPrint("ERROR OCCURRED: $e");
      debugPrint("STACK TRACE: $s");
      rethrow;
    }
  }

  @override
  Future<List<ImageEntity>> getImages() async {
    final models = await localDataSource.getImages();

    return models.map((model) {
      final Uint8List bytes = base64Decode(model.base64String);

      return ImageEntity(
        id: model.id,
        base64String: model.base64String,
        aspectRatio: model.aspectRatio,
        bytes: bytes,
      );
    }).toList();
  }

  String _encodeToBase64Isolate(Uint8List bytes) {
    return base64Encode(bytes);
  }
}
