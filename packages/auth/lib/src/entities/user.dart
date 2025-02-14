part of '../../../auth.dart';

class User {
  final String? id;
  final String? firstName;
  final dynamic lastName;
  final String? username;
  final dynamic profilePicture;
  final String? license;
  final dynamic roles;
  final int? iat;
  final int? exp;
  final String? iss;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.profilePicture,
    this.license,
    this.roles,
    this.iat,
    this.exp,
    this.iss,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        username: json["username"],
        profilePicture: json["profilePicture"],
        license: json["license"],
        roles: json["roles"],
        iat: json["iat"],
        exp: json["exp"],
        iss: json["iss"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "profilePicture": profilePicture,
        "license": license,
        "roles": roles,
        "iat": iat,
        "exp": exp,
        "iss": iss,
      };
}
