import 'dart:convert';

LoginReqModel loginReqModelFromMap(String str) => LoginReqModel.fromMap(json.decode(str));

String loginReqModelToMap(LoginReqModel data) => json.encode(data.toMap());

class LoginReqModel {
  LoginReqModel({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  String name;
  String email;
  String password;
  String passwordConfirmation;

  factory LoginReqModel.fromMap(Map<String, dynamic> json) => LoginReqModel(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    passwordConfirmation: json["password_confirmation"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email,
    "password": password,
    "password_confirmation": passwordConfirmation,
  };
}
