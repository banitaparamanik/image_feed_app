import 'dart:convert';
import 'dart:io';

import 'package:image_feed_app/features/data/models/image_feed_models/image_model.dart';
import 'package:path_provider/path_provider.dart';

abstract class ImageLocalDataSource {
  Future<void> saveImage(ImageModel image);
  Future<List<ImageModel>> getImages();
}

class ImageLocalDataSourceImpl implements ImageLocalDataSource {
  @override
  Future<void> saveImage(ImageModel image) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/${image.id}.json');
    await file.writeAsString(jsonEncode(image.toJson()));
  }

  @override
  Future<List<ImageModel>> getImages() async {
    final dir = await getApplicationDocumentsDirectory();
    final files = dir.listSync().where((e) => e.path.endsWith('.json'));

    return files.map((file) {
      final data = jsonDecode(File(file.path).readAsStringSync());
      return ImageModel.fromJson(data);
    }).toList();
  }
}
