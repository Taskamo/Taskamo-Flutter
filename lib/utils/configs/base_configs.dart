abstract class BaseConfig {
  String get baseUrl;
}

class ProductionConfig extends BaseConfig {
  @override
  String get baseUrl => "http://taskamo.com";
}
