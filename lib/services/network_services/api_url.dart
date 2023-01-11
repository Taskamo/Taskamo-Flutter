import 'package:taskamo/utils/configs/config_environments.dart';

class GetUrl {
  String getUrlAPI() {
    return Environment().config.baseUrl;
  }

  String versionUrl() {
    return "/api";
  }
}
