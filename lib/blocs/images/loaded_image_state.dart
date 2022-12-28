part of 'loaded_image_cubit.dart';

abstract class LoadedImageState {}

class LoadedImageInitial extends LoadedImageState {}

class LoadedImage extends LoadedImageState {
  LoadedImage({
    required this.taskamo,
    required this.taskamoTypo,
    required this.taskamoLogo,
    required this.profile,
  });

  final Image taskamo;
  final Image taskamoTypo;
  final Image taskamoLogo;
  final Image profile;
}
