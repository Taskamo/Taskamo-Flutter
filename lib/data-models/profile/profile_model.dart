import 'dart:convert';

ProfileModel profileModelFromMap(Map<String, dynamic> str) =>
    ProfileModel.fromMap(str);

String profileModelToMap(ProfileModel data) => json.encode(data.toMap());

class ProfileModel {
  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.profile,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? email;
  String? profile;
  final String? emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        profile: json["profile"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "profile": profile,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
