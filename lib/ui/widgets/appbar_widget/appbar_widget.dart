import 'package:flutter/material.dart';
import 'package:taskamo/ui/widgets/decoration_widget/decoration_widget.dart';
import 'package:taskamo/ui/widgets/icon_widget/icon_widget.dart';
import 'package:taskamo/ui/widgets/time_widget/time_widget.dart';
import 'package:taskamo/utils/categories/icon_categories.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';
import 'package:taskamo/utils/styles/decoration/decoration.dart';

class TaskamoAppbar extends StatelessWidget {
  const TaskamoAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverAppBar(
        backgroundColor: Colors.transparent,
        floating: true,
        flexibleSpace: DecorationWidget(
          container: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: TaskamoDecoration.decoration,
            child: Row(
              children: [
                const DateWidget(),
                const Expanded(child: SizedBox()),
                const TimeWidget(),
                const SizedBox(width: 8),
                Container(
                  height: 6,
                  width: 6,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: TaskamoColors.white,
                  ),
                ),
                const Expanded(child: SizedBox()),
                const IconWidget(
                  url: TaskamoIconCategories.menu,
                  height: 24,
                  width: 24,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
