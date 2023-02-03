import 'dart:convert';
import 'dart:io';

EditProfileModel editProfileModelFromMap(String str) =>
    EditProfileModel.fromMap(json.decode(str));

String editProfileModelToMap(EditProfileModel data) =>
    json.encode(data.toMap());

class EditProfileModel {
  EditProfileModel({
    this.profile,
    required this.name,
  });

  final File? profile;
  final String name;

  factory EditProfileModel.fromMap(Map<String, dynamic> json) =>
      EditProfileModel(
        profile: json["profile"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() {
    if (profile == null) {
      return {
        "name": name,
        "_method": "PUT",
      };
    }
    return {
      "profile": profile,
      "name": name,
      "_method": "PUT",
    };
  }
}
