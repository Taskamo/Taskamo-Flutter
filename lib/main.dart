import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskamo/blocs/images/loaded_image_cubit.dart';
import 'package:taskamo/screen_router.dart';
import 'package:taskamo/services/local_services/hive_client.dart';
import 'package:taskamo/utils/categories/image_categories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskamo/utils/configs/config_environments.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await Hive.initFlutter();
  await TaskamoHiveClient.saveKey();
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.production,
  );
  Environment().initConfig(environment);
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

  @override
  void initState() {
    super.initState();
    taskamo = Image.asset(TaskamoImageCategories.taskamo);
    taskamoTypo = Image.asset(TaskamoImageCategories.taskamoTypo);
    taskamoLogo = Image.asset(TaskamoImageCategories.taskamoLogo);
  }

  @override
  void didChangeDependencies() {
    precacheImage(taskamo.image, context);
    precacheImage(taskamoTypo.image, context);
    precacheImage(taskamoLogo.image, context);
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
        ),
      child: const TaskamoRouter(),
    );
  }
}
