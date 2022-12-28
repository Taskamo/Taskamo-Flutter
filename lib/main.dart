import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskamo/blocs/images/loaded_image_cubit.dart';
import 'package:taskamo/screen_router.dart';
import 'package:taskamo/services/local_services/hive_client.dart';
import 'package:taskamo/utils/categories/image_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await TaskamoHiveClient.saveKey();

  runApp(
    const App(),
  );
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Image taskamo;
  late Image taskamoTypo;
  late Image taskamoLogo;
  late Image profile;

  @override
  void initState() {
    super.initState();
    taskamo = Image.asset(TaskamoImageCategories.taskamo);
    taskamoTypo = Image.asset(TaskamoImageCategories.taskamoTypo);
    taskamoLogo = Image.asset(TaskamoImageCategories.taskamoLogo);
    profile = Image.asset(TaskamoImageCategories.profile);
  }

  @override
  void didChangeDependencies() {
    precacheImage(taskamo.image, context);
    precacheImage(taskamoTypo.image, context);
    precacheImage(taskamoLogo.image, context);
    precacheImage(profile.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoadedImageCubit()
        ..setImages(
          taskamo: taskamo,
          taskamoTypo: taskamoTypo,
          taskamoLogo: taskamoLogo,
          profile: profile,
        ),
      child: const TaskamoRouter(),
    );
  }
}
