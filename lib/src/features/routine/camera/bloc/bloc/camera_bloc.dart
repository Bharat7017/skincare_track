import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final ImagePicker _picker = ImagePicker();
  CameraBloc() : super(ImageInitialState()) {
    on<PickImageEvent>(pickImage);
    on<UploadImageEvent>(uploadImage);
  }

  FutureOr<void> pickImage(
      PickImageEvent event, Emitter<CameraState> emit) async {
    emit(ImagePickingState());
    try {
      final pickedFile = await _picker.pickImage(source: event.source);
      if (pickedFile != null) {

        add(UploadImageEvent(File(pickedFile.path)));
      }
    } catch (e) {
      emit(ImageErrorState('Error picking image: $e'));
    }
  }

  FutureOr<void> uploadImage(
      UploadImageEvent event, Emitter<CameraState> emit) async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      final uploadTask = storageRef.putFile(event.image);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();
      emit(ImageUploadedState(downloadUrl));
    } catch (e) {
      emit(ImageErrorState('Error uploading image: $e'));
    }
  }
}
