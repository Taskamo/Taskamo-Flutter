import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskamo/blocs/images/loaded_image_cubit.dart';
import 'package:taskamo/blocs/images/loaded_image_cubit.dart';
import 'package:taskamo/ui/widgets/image_widget/image_widget.dart';
import 'package:taskamo/utils/categories/image_categories.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: BlocBuilder<LoadedImageCubit, LoadedImageState>(
            builder: (context, state) {
              if (state is LoadedImage){
                return ImageWidget(
                  image: state.taskamoTypo,
                  height: 200,
                  width: 200,
                );
              }else{
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
