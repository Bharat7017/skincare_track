part of 'camera_bloc.dart';

sealed class CameraEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PickImageEvent extends CameraEvent {
  final ImageSource source;

  PickImageEvent(this.source);

  @override
  List<Object> get props => [source];
}

class UploadImageEvent extends CameraEvent {
  final File image;

  UploadImageEvent(this.image);

  @override
  List<Object> get props => [image];
}
