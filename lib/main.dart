import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskamo/screen_router.dart';
import 'package:taskamo/services/local_services/hive_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await TaskamoHiveClient.saveKey();

  runApp(
    const TaskamoRouter(),
  );
}
