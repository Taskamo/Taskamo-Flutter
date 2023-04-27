import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/localization.dart';
import 'package:taskamo/blocs/api/profile/profile_bloc.dart';
import 'package:taskamo/data-models/profile/edit_profile_model.dart';
import 'package:taskamo/ui/widgets/appbar_widget/create_appbar.dart';
import 'package:taskamo/ui/widgets/button_widget/button_widget.dart';
import 'package:taskamo/ui/widgets/decoration_widget/decoration_widget.dart';
import 'package:taskamo/ui/widgets/drawer_widget/drawer_widget.dart';
import 'package:taskamo/ui/widgets/image_picker/image_picker.dart';
import 'package:taskamo/ui/widgets/text_field_widget/text_field_widget.dart';
import 'package:taskamo/utils/categories/locale_categories.dart';
import 'package:taskamo/utils/styles/colors/taskamo_colors.dart';
import 'package:taskamo/utils/styles/decoration/decoration.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController name;
  bool selected = false;
  File? image;

  bool _getValidations() {
    if (name.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
  }

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          endDrawer: const DrawerWidget(),
          body: CustomScrollView(
            slivers: [
              const CreateAppbar(),
              SliverFillRemaining(
                hasScrollBody: false,
                child: DecorationWidget(
                  margin: const EdgeInsets.all(8),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: TaskamoDecoration.decoration,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            TaskamoLocaleCategories.editProfile.i18n(),
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFieldWidget(
                            textEditingController: name,
                            label: TaskamoLocaleCategories.username.i18n(),
                            hint: TaskamoLocaleCategories.username.i18n(),
                            onChange: (value) {
                              setState(
                                () {},
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: GestureDetector(
                            onTap: () async {
                              // image = await PickImage().profilePicker();
                              // if (image != null) {
                              //   selected = true;
                              // }
                              setState(
                                () {},
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: (image == null)
                                    ? Colors.transparent
                                    : TaskamoColors.blue.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: TaskamoColors.secondaryText,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    TaskamoLocaleCategories.selectPicture
                                        .i18n(),
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: TextButtonWidget(
              color: (_getValidations())
                  ? TaskamoColors.blue
                  : TaskamoColors.blue.withOpacity(0.3),
              margin: const EdgeInsets.all(8),
              text: TaskamoLocaleCategories.submit.i18n(),
              onPressed: (_getValidations())
                  ? () {
                      if (image != null) {
                        EditProfileModel profileModel = EditProfileModel(
                          name: name.text,
                          profile: image,
                        );
                        context.read<ProfileBloc>().add(
                              EditProfileEvent(
                                editProfileModel: profileModel,
                              ),
                            );
                      } else {
                        EditProfileModel profileModel = EditProfileModel(
                          name: name.text,
                        );
                        context.read<ProfileBloc>().add(
                              EditProfileNameEvent(
                                editProfileModel: profileModel,
                              ),
                            );
                      }

                      Navigator.of(context).pop();
                    }
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
