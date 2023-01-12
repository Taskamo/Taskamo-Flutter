// To parse this JSON data, do
//
//     final signupModel = signupModelFromMap(jsonString);

import 'dart:convert';

SignupModel signupModelFromMap(String str) => SignupModel.fromMap(json.decode(str));

String signupModelToMap(SignupModel data) => json.encode(data.toMap());

class SignupModel {
  SignupModel({
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
  });

  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;

  factory SignupModel.fromMap(Map<String, dynamic> json) => SignupModel(
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
