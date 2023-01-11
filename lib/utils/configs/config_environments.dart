import 'package:taskamo/utils/configs/base_configs.dart';

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String production = 'Production';

  late BaseConfig config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.production:
        return ProductionConfig();
      default:
        return ProductionConfig();
    }
  }
}
