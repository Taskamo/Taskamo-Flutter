abstract class BaseConfig {
  String get baseUrl;
}

class ProductionConfig extends BaseConfig {
  @override
  String get baseUrl => "https://panel.darato.ir";
}
