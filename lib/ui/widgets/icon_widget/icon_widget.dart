import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    Key? key,
    required this.url,
    required this.height,
    required this.width,
    this.color,
  }) : super(key: key);
  final String url;
  final double height;
  final double width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      url,
      fit: BoxFit.contain,
      height: height,
      width: width,
      color: color,
    );
  }
}
