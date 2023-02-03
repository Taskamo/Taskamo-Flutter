import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:taskamo/blocs/api/profile/profile_bloc.dart';
import 'package:taskamo/blocs/images/loaded_image_cubit.dart';
import 'package:taskamo/blocs/router/taskamo_router_bloc.dart';
import 'package:taskamo/ui/widgets/button_widget/button_widget.dart';
import 'package:taskamo/ui/widgets/decoration_widget/decoration_widget.dart';
import 'package:taskamo/ui/widgets/icon_widget/icon_widget.dart';
import 'package:taskamo/ui/widgets/image_widget/image_widget.dart';
import 'package:taskamo/ui/widgets/time_widget/time_widget.dart';
import 'package:taskamo/utils/categories/icon_categories.dart';
import 'package:taskamo/utils/categories/locale_categories.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';
import 'dart:ui' show ImageFilter;

class LoginDrawerWidget extends StatelessWidget {
  const LoginDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      backgroundColor: TaskamoColors.black.withOpacity(0.5),
      child: SafeArea(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaY: 2.5,
            sigmaX: 2.5,
          ),
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(8),
            child: Column(
              children: const [
                DrawerAppbarWidget(),
                LoginDrawerAvatarWidget(),
                LoginDrawerCreatorsWidget(),
                Expanded(child: SizedBox()),
                LoginDrawerMadeByWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginDrawerMadeByWidget extends StatelessWidget {
  const LoginDrawerMadeByWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        "Made by Flutter and love",
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}

class LoginDrawerCreatorsWidget extends StatelessWidget {
  const LoginDrawerCreatorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.displayLarge,
          children: [
            TextSpan(
              text: TaskamoLocaleCategories.creators.i18n(),
            ),
            TextSpan(
              text: TaskamoLocaleCategories.cNames.i18n(),
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 18,
                  ),
            ),
            TextSpan(
              text: TaskamoLocaleCategories.thanksTo.i18n(),
            ),
            TextSpan(
              text: TaskamoLocaleCategories.tNames.i18n(),
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 18,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      backgroundColor: TaskamoColors.black.withOpacity(0.5),
      child: SafeArea(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaY: 2.5,
            sigmaX: 2.5,
          ),
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const DrawerAppbarWidget(),
                const DrawerAvatarWidget(),
                const DrawerNameWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: TextButtonWidget(
                          overlay: TaskamoColors.white.withOpacity(0.3),
                          color: TaskamoColors.white.withOpacity(0.15),
                          text: TaskamoLocaleCategories.home.i18n(),
                          style: Theme.of(context).textTheme.titleMedium,
                          onPressed: () {
                            Scaffold.of(context).closeEndDrawer();
                            Future.delayed(
                              const Duration(milliseconds: 200),
                              () {
                                context
                                    .read<TaskamoRouterBloc>()
                                    .add(HomeScreenEvent());
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 5,
                        child: TextButtonWidget(
                          overlay: TaskamoColors.white.withOpacity(0.3),
                          color: TaskamoColors.white.withOpacity(0.15),
                          text: TaskamoLocaleCategories.timeLine.i18n(),
                          style: Theme.of(context).textTheme.titleMedium,
                          onPressed: () {
                            Scaffold.of(context).closeEndDrawer();
                            Future.delayed(
                              const Duration(milliseconds: 200),
                              () {
                                context
                                    .read<TaskamoRouterBloc>()
                                    .add(TimelineScreenEvent());
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: TextButtonWidget(
                          overlay: TaskamoColors.white.withOpacity(0.3),
                          color: TaskamoColors.white.withOpacity(0.15),
                          text: TaskamoLocaleCategories.events.i18n(),
                          style: Theme.of(context).textTheme.titleMedium,
                          onPressed: () {
                            Scaffold.of(context).closeEndDrawer();
                            Future.delayed(
                              const Duration(milliseconds: 200),
                              () {
                                context
                                    .read<TaskamoRouterBloc>()
                                    .add(EventScreenEvent());
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 4,
                        child: TextButtonWidget(
                          overlay: TaskamoColors.white.withOpacity(0.3),
                          color: TaskamoColors.white.withOpacity(0.15),
                          text: TaskamoLocaleCategories.toDo.i18n(),
                          style: Theme.of(context).textTheme.titleMedium,
                          onPressed: () {
                            Scaffold.of(context).closeEndDrawer();
                            Future.delayed(
                              const Duration(milliseconds: 200),
                              () {
                                context
                                    .read<TaskamoRouterBloc>()
                                    .add(TodoScreenEvent());
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: TextButtonWidget(
                    overlay: TaskamoColors.white.withOpacity(0.3),
                    color: TaskamoColors.white.withOpacity(0.15),
                    text: TaskamoLocaleCategories.calendar.i18n(),
                    style: Theme.of(context).textTheme.titleMedium,
                    onPressed: () {
                      Scaffold.of(context).closeEndDrawer();
                      Future.delayed(
                        const Duration(milliseconds: 200),
                        () {
                          context
                              .read<TaskamoRouterBloc>()
                              .add(CalendarScreenEvent());
                        },
                      );
                    },
                  ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: ButtonWidget(
                          overlay: TaskamoColors.white.withOpacity(0.3),
                          color: TaskamoColors.white.withOpacity(0.15),
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const IconWidget(
                                url: TaskamoIconCategories.setting,
                                height: 24,
                                width: 24,
                                color: TaskamoColors.secondaryText,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                TaskamoLocaleCategories.setting.i18n(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .apply(
                                      color: TaskamoColors.secondaryText,
                                    ),
                              ),
                            ],
                          ),
                          onPressed: null,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 3,
                        child: ButtonWidget(
                          overlay: TaskamoColors.white.withOpacity(0.3),
                          color: TaskamoColors.white.withOpacity(0.15),
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const IconWidget(
                                url: TaskamoIconCategories.profile,
                                height: 24,
                                width: 24,
                                color: TaskamoColors.white,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                TaskamoLocaleCategories.profile.i18n(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 1,
                        child: ButtonWidget(
                          color: TaskamoColors.red.withOpacity(0.1),
                          overlay: Colors.red.withOpacity(0.3),
                          widget: const IconWidget(
                            url: TaskamoIconCategories.exit,
                            height: 24,
                            width: 24,
                          ),
                          onPressed: () {
                            context
                                .read<TaskamoRouterBloc>()
                                .add(LogoutEvent());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerNameWidget extends StatelessWidget {
  const DrawerNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
          child: Text(
            (state is ProfileDataState) ? state.profileModel.name ?? "" : "",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        );
      },
    );
  }
}

class LoginDrawerAvatarWidget extends StatelessWidget {
  const LoginDrawerAvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadedImageCubit, LoadedImageState>(
      builder: (context, state) {
        if (state is LoadedImage) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: ImageWidget(
                image: state.taskamoTypo,
                height: 200,
                width: 200,
              ),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: const SizedBox(
              width: 200,
              height: 200,
            ),
          ),
        );
      },
    );
  }
}

class DrawerAvatarWidget extends StatelessWidget {
  const DrawerAvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadedImageCubit, LoadedImageState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
          child: Stack(
            children: [
              if (state is LoadedImage)
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: ImageWidget(
                    image: state.profile,
                    height: 100,
                    width: 100,
                  ),
                ),
              Positioned(
                right: 2,
                bottom: 2,
                child: Container(
                  height: 14,
                  width: 14,
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: TaskamoColors.black,
                  ),
                  child: Container(
                      decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: TaskamoColors.green,
                  )),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class DrawerAppbarWidget extends StatelessWidget {
  const DrawerAppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecorationWidget(
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: TaskamoColors.black,
        ),
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
            IconButtonWidget(
              widget: Transform.rotate(
                angle: -3.14 / 4,
                child: const IconWidget(
                  url: TaskamoIconCategories.plus,
                  height: 32,
                  width: 32,
                ),
              ),
              onPressed: () => Scaffold.of(context).closeEndDrawer(),
            ),
          ],
        ),
      ),
    );
  }
}
