import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';

class PickImage {
  final ImagePicker _picker = ImagePicker();
  late File _image;

  Future<File> profilePicker() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    _image = File(image!.path);
    // await _cropProfileImage(image.path);
    return _image;
  }

  // Future<void> _cropProfileImage(String imagePath) async {
  //   CroppedFile? croppedFile = await ImageCropper().cropImage(
  //     sourcePath: imagePath,
  //     aspectRatioPresets: [
  //       CropAspectRatioPreset.square,
  //     ],
  //     uiSettings: [
  //       AndroidUiSettings(
  //         toolbarTitle: "بریدن عکس",
  //         toolbarColor: TaskamoColors.blue,
  //         toolbarWidgetColor: Colors.white,
  //         initAspectRatio: CropAspectRatioPreset.original,
  //         lockAspectRatio: true,
  //       ),
  //     ],
  //   );
  //   if (croppedFile != null) {
  //     _image = File(croppedFile.path);
  //   }
  // }
}
