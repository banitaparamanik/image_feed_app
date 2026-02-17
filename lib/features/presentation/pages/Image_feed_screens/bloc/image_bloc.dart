import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_feed_app/features/domain/entities/image_entity.dart';
import 'package:image_feed_app/features/domain/repositories/image_feed_repository/image_repository.dart';
import 'package:image_picker/image_picker.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepository repository;
  final ImagePicker picker = ImagePicker();

  ImageBloc(this.repository) : super(const ImageState()) {
    on<PickImages>(_pickImages);
    on<LoadImages>(_loadImages);
    on<ToggleLayout>(_toggleLayout);
  }

  Future<void> _pickImages(PickImages event, Emitter<ImageState> emit) async {
    emit(state.copyWith(loading: true));

    final files = await picker.pickMultiImage();
    if (files.isNotEmpty) {
      for (final file in files) {
        await repository.uploadImage(File(file.path));
      }
    }

    add(LoadImages());
  }

  Future<void> _loadImages(LoadImages event, Emitter<ImageState> emit) async {
    final images = await repository.getImages();
    emit(state.copyWith(images: images, loading: false));
  }

  void _toggleLayout(ToggleLayout event, Emitter<ImageState> emit) {
    emit(
      state.copyWith(
        layout: state.layout == FeedLayout.fixed
            ? FeedLayout.dynamic
            : FeedLayout.fixed,
      ),
    );
  }
}
