import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:taskamo/blocs/images/loaded_image_cubit.dart';
import 'package:taskamo/blocs/router/taskamo_router_bloc.dart';
import 'package:taskamo/ui/widgets/appbar_widget/appbar_widget.dart';
import 'package:taskamo/ui/widgets/button_widget/button_widget.dart';
import 'package:taskamo/ui/widgets/checkbox_widget/checkbox_widget.dart';
import 'package:taskamo/ui/widgets/decoration_widget/decoration_widget.dart';
import 'package:taskamo/ui/widgets/drawer_widget/drawer_widget.dart';
import 'package:taskamo/ui/widgets/icon_widget/icon_widget.dart';
import 'package:taskamo/ui/widgets/image_widget/image_widget.dart';
import 'package:taskamo/ui/widgets/text_field_widget/text_field_widget.dart';
import 'package:taskamo/utils/categories/icon_categories.dart';
import 'package:taskamo/utils/categories/locale_categories.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';
import 'package:taskamo/utils/styles/decoration/decoration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _value = false;
  bool _obSecure = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          endDrawer: const LoginDrawerWidget(),
          body: CustomScrollView(
            slivers: [
              const TaskamoAppbar(),
              SliverFillRemaining(
                hasScrollBody: false,
                child: DecorationWidget(
                  margin: const EdgeInsets.all(8),
                  container: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 32,
                    ),
                    decoration: TaskamoDecoration.decoration,
                    child: BlocBuilder<LoadedImageCubit, LoadedImageState>(
                      builder: (context, state) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (state is LoadedImage)
                              ImageWidget(
                                image: state.taskamoLogo,
                                height: 80,
                                width: 80,
                              ),
                            const SizedBox(height: 32),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: TextFieldWidget(
                                label: TaskamoLocaleCategories.email.i18n(),
                                hint: TaskamoLocaleCategories.email.i18n(),
                                onChange: (value) {
                                  //TODO here
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: TextFieldWidget(
                                label: TaskamoLocaleCategories.password.i18n(),
                                hint: TaskamoLocaleCategories.password.i18n(),
                                obSecure: _obSecure,
                                onChange: (value) {
                                  //TODO here
                                },
                                suffix: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      width: 1,
                                      height: 20,
                                      color: TaskamoColors.secondaryText,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            _obSecure = !_obSecure;
                                          },
                                        );
                                      },
                                      child: const IconWidget(
                                        url: TaskamoIconCategories.eye,
                                        height: 16,
                                        width: 16,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                  ],
                                ),
                              ),
                            ),
                            CheckBoxWidget(
                              text: TaskamoLocaleCategories.rememberMe.i18n(),
                              onChanged: (value) {
                                setState(
                                  () {
                                    _value = value!;
                                    //TODO here
                                  },
                                );
                              },
                              value: _value,
                            ),
                            const Expanded(child: SizedBox()),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                                children: [
                                  TextSpan(
                                    text: TaskamoLocaleCategories
                                        .youDontHaveAccount
                                        .i18n(),
                                  ),
                                  const TextSpan(
                                    text: '\n',
                                  ),
                                  TextSpan(
                                    text: TaskamoLocaleCategories.signUp.i18n(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .apply(
                                          decoration: TextDecoration.underline,
                                          color: TaskamoColors.blue,
                                        ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        //TODO here
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: TextButtonWidget(
              margin: const EdgeInsets.all(8),
              text: TaskamoLocaleCategories.login.i18n(),
              onPressed: () {
                context.read<TaskamoRouterBloc>().add(HomeScreenEvent());
              },
            ),
          ),
        ),
      ),
    );
  }
}
