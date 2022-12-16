import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskamo/utils/categories/hive_catrgories.dart';

abstract class TaskamoHiveClient {
  static const secureStorage = FlutterSecureStorage();

  static late final String _secureKey;

  static Future<void> saveKey() async {
    if (await secureStorage.read(
          key: TaskamoHiveCategories.taskamoSecureKey,
        ) ==
        null) {
      _secureKey = json.encode(Hive.generateSecureKey());
      await secureStorage.write(
        key: TaskamoHiveCategories.taskamoSecureKey,
        value: _secureKey,
      );
    } else {
      _secureKey = await secureStorage.read(
            key: TaskamoHiveCategories.taskamoSecureKey,
          ) ??
          '';
    }
  }

  static Future<void> write({
    required String key,
    required dynamic value,
  }) async {
    try {
      List<int> encryptionKey = (json.decode(
        _secureKey,
      ) as List<dynamic>)
          .cast<int>();
      final encryptedBox = await Hive.openBox(
        TaskamoHiveCategories.taskamoSecureBox,
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
      await encryptedBox.put(key, value);
      await encryptedBox.close();
    } on Exception catch (e) {
      Logger().e(e.toString());
    }
  }

  static Future<dynamic> read({
    required String key,
  }) async {
    try {
      List<int> encryptionKey =
          (json.decode(_secureKey) as List<dynamic>).cast<int>();
      final encryptedBox = await Hive.openBox(
        TaskamoHiveCategories.taskamoSecureBox,
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
      dynamic value = await encryptedBox.get(key);
      await encryptedBox.close();
      return value;
    } on Exception catch (e) {
      Logger().e(e.toString());
      return null;
    }
  }

  static Future<void> delete({
    required String key,
  }) async {
    try {
      List<int> encryptionKey =
          (json.decode(_secureKey) as List<dynamic>).cast<int>();
      final encryptedBox = await Hive.openBox(
        TaskamoHiveCategories.taskamoSecureBox,
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
      await encryptedBox.delete(key);
      await encryptedBox.close();
    } on Exception catch (e) {
      Logger().e(e.toString());
    }
  }
}
