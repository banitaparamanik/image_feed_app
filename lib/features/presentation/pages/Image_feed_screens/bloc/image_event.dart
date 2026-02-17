part of 'image_bloc.dart';

abstract class ImageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PickImages extends ImageEvent {}

class LoadImages extends ImageEvent {}

class ToggleLayout extends ImageEvent {}
