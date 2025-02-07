import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skincare_track/src/features/routine/camera/bloc/bloc/camera_bloc.dart';

class CameraButton extends StatefulWidget {
  const CameraButton({super.key});

  @override
  State<CameraButton> createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Wrap(
                    children: [
                      ListTile(
                        leading: Icon(Icons.camera),
                        title: Text('Take a photo'),
                        onTap: () {
                          Navigator.pop(context);
                         
                          context
                              .read<CameraBloc>()
                              .add(PickImageEvent(ImageSource.camera));
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.photo_album),
                        title: Text('Select from gallery'),
                        onTap: () {
                          Navigator.pop(context);
                          context
                              .read<CameraBloc>()
                              .add(PickImageEvent(ImageSource.gallery));
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Icon(
              Icons.camera_alt_outlined,
              size: 20,
            ),
          ),
          BlocBuilder<CameraBloc, CameraState>(
            builder: (context, state) {
              if (state is ImageUploadedState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Image uploaded successfully!')),
                  );
                });
              } else if (state is ImageErrorState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error uploading image')),
                  );
                });

              }

              return Container(); 
            },
          )
        ],
      ),
    );
  }
}
