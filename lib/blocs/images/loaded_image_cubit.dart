import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'loaded_image_state.dart';

class LoadedImageCubit extends Cubit<LoadedImageState> {
  LoadedImageCubit() : super(LoadedImageInitial());

  void setImages({
    required Image taskamo,
    required Image taskamoTypo,
    required Image taskamoLogo,
    required Image profile,
  }) {
    emit(
      LoadedImage(
        taskamo: taskamo,
        taskamoTypo: taskamoTypo,
        taskamoLogo: taskamoLogo,
        profile: profile,
      ),
    );
  }
}
