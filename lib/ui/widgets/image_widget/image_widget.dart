import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.image,
    required this.height,
    required this.width,
  }) : super(key: key);
  final Image image;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image.image,
      height: height,
      width: width,
    );
  }
}