import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.url,
    required this.height,
    required this.width,
  }) : super(key: key);
  final String url;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      url,
      height: height,
      width: width,
    );
  }
}
