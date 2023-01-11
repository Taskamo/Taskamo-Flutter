import 'dart:convert';

TokenModel tokenModelFromMap(Map<String, dynamic> str) =>
    TokenModel.fromMap(str);

String tokenModelToMap(TokenModel data) => json.encode(data.toMap());

class TokenModel {
  TokenModel({
    required this.data,
  });

  Data data;

  factory TokenModel.fromMap(Map<String, dynamic> json) => TokenModel(
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data.toMap(),
      };
}

class Data {
  Data({
    required this.token,
  });

  String token;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
      };
}
