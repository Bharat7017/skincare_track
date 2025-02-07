part of 'camera_bloc.dart';

sealed class CameraState extends Equatable {
  const CameraState();

  @override
  List<Object> get props => [];
}

class ImageInitialState extends CameraState {}

class ImagePickingState extends CameraState {}



class ImageUploadedState extends CameraState {
  final String imageUrl;

  const ImageUploadedState(this.imageUrl);

  @override
  List<Object> get props => [imageUrl];
}

class ImageErrorState extends CameraState {
  final String error;

  const ImageErrorState(this.error);

  @override
  List<Object> get props => [error];
}
