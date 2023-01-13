import 'package:flutter/material.dart';
import 'package:taskamo/ui/widgets/button_widget/button_widget.dart';
import 'package:taskamo/ui/widgets/decoration_widget/decoration_widget.dart';
import 'package:taskamo/ui/widgets/icon_widget/icon_widget.dart';
import 'package:taskamo/ui/widgets/time_widget/time_widget.dart';
import 'package:taskamo/utils/categories/icon_categories.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';
import 'package:taskamo/utils/styles/decoration/decoration.dart';

class CreateAppbar extends StatelessWidget {
  const CreateAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        floating: true,
        actions: <Widget>[Container()],
        flexibleSpace: DecorationWidget(
          child: Container(
            decoration: TaskamoDecoration.decoration,
            child: Row(
              children: [
                IconButtonWidget(
                  widget: const IconWidget(
                    url: TaskamoIconCategories.arrowLeftSmall,
                    height: 24,
                    width: 24,
                    color: TaskamoColors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
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
                IconButtonWidget(
                  widget: const IconWidget(
                    url: TaskamoIconCategories.menu,
                    height: 24,
                    width: 24,
                  ),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
