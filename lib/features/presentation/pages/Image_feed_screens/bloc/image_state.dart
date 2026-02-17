part of 'image_bloc.dart';

enum FeedLayout { fixed, dynamic }

class ImageState extends Equatable {
  final List<ImageEntity> images;
  final bool loading;
  final FeedLayout layout;

  const ImageState({
    this.images = const [],
    this.loading = false,
    this.layout = FeedLayout.dynamic,
  });

  ImageState copyWith({
    List<ImageEntity>? images,
    bool? loading,
    FeedLayout? layout,
  }) {
    return ImageState(
      images: images ?? this.images,
      loading: loading ?? this.loading,
      layout: layout ?? this.layout,
    );
  }

  @override
  List<Object?> get props => [images, loading, layout];
}
