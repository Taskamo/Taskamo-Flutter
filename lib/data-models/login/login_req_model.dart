import 'dart:convert';

LoginReqModel loginReqModelFromMap(String str) =>
    LoginReqModel.fromMap(json.decode(str));

String loginReqModelToMap(LoginReqModel data) => json.encode(data.toMap());

class LoginReqModel {
  LoginReqModel({
    this.email,
    this.password,
  });

  String? email;
  String? password;

  factory LoginReqModel.fromMap(Map<String, dynamic> json) => LoginReqModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
      };
}
