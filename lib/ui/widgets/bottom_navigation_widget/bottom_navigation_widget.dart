import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskamo/blocs/router/taskamo_router_bloc.dart';
import 'package:taskamo/ui/widgets/decoration_widget/decoration_widget.dart';
import 'package:taskamo/ui/widgets/icon_widget/icon_widget.dart';
import 'package:taskamo/utils/categories/icon_categories.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({
    Key? key,
    required this.activeIndex,
  }) : super(key: key);
  final int activeIndex;

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  static final List<TaskamoRouterEvent> event = [
    CalendarScreenEvent(),
    TaskScreenEvent(),
    EventScreenEvent(),
    TimelineScreenEvent(),
    HomeScreenEvent(),
  ];

  void onTabTapped(int index) {
    context.read<TaskamoRouterBloc>().add(event[index]);
  }

  @override
  Widget build(BuildContext context) {
    return DecorationWidget(
      margin: const EdgeInsets.all(8),
      child: FloatingNavbar(
        borderRadius: 8,
        selectedBackgroundColor: Colors.transparent,
        backgroundColor: Theme.of(context).backgroundColor,
        selectedItemColor: TaskamoColors.blue,
        unselectedItemColor: TaskamoColors.white,
        onTap: onTabTapped,
        currentIndex: widget.activeIndex,
        margin: const EdgeInsets.all(0),
        items: [
          bottomNavigationBarItemBuilder(
            url: TaskamoIconCategories.calendar,
            isActive: widget.activeIndex == 0,
          ),
          bottomNavigationBarItemBuilder(
            url: TaskamoIconCategories.task,
            isActive: widget.activeIndex == 1,
          ),
          bottomNavigationBarItemBuilder(
            url: TaskamoIconCategories.event,
            isActive: widget.activeIndex == 2,
          ),
          bottomNavigationBarItemBuilder(
            url: TaskamoIconCategories.timeLine,
            isActive: widget.activeIndex == 3,
          ),
          bottomNavigationBarItemBuilder(
            url: TaskamoIconCategories.home,
            isActive: widget.activeIndex == 4,
          ),
        ],
      ),
    );
  }

  FloatingNavbarItem bottomNavigationBarItemBuilder({
    required String url,
    required bool isActive,
  }) {
    return FloatingNavbarItem(
      customWidget: AnimatedColumn(
        isActive: isActive,
        url: url,
      ),
    );
  }
}

class AnimatedColumn extends StatefulWidget {
  const AnimatedColumn({
    Key? key,
    required this.url,
    required this.isActive,
  }) : super(key: key);
  final String url;
  final bool isActive;

  @override
  State<AnimatedColumn> createState() => _AnimatedColumnState();
}

class _AnimatedColumnState extends State<AnimatedColumn>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.isActive
            ? AnimatedIcons(
                controller: _controller,
                start: TaskamoColors.white,
                end: TaskamoColors.blue,
                url: widget.url,
              )
            : AnimatedIcons(
          controller: _controller,
          start: TaskamoColors.white,
          end: TaskamoColors.white,
          url: widget.url,
        ),
        const SizedBox(height: 4),
        widget.isActive
            ? AnimatedDote(
                controller: _controller,
                start: Colors.transparent,
                end: TaskamoColors.blue,
              )
            : AnimatedDote(
          controller: _controller,
          start: Colors.transparent,
          end: Colors.transparent,
        ),
      ],
    );
  }
}

class AnimatedIcons extends StatelessWidget {
  AnimatedIcons({
    super.key,
    required this.controller,
    required this.start,
    required this.end,
    required this.url,
  }) : color = ColorTween(
          begin: start,
          end: end,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              1.0,
              curve: Curves.linear,
            ),
          ),
        );
  final Color start;
  final Color end;
  final Animation<double> controller;
  final Animation<Color?> color;
  final String url;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return IconWidget(
          url: url,
          height: 24,
          width: 24,
          color: color.value,
        );
      },
    );
  }
}

class AnimatedDote extends StatelessWidget {
  AnimatedDote({
    super.key,
    required this.controller,
    required this.start,
    required this.end,
  }) : color = ColorTween(
          begin: start,
          end: end,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              1.0,
              curve: Curves.linear,
            ),
          ),
        );
  final Color start;
  final Color end;
  final Animation<double> controller;
  final Animation<Color?> color;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          height: 4,
          width: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.value,
          ),
        );
      },
    );
  }
}
