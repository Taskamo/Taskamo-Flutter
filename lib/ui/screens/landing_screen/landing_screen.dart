import 'package:flutter/material.dart';
import 'package:taskamo/ui/widgets/image_widget/image_widget.dart';
import 'package:taskamo/utils/categories/image_categories.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ImageWidget(
          url: TaskamoImageCategories.taskamoTypo,
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
