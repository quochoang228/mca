part of '../../../auth.dart';

class AuthResponse {
  final String? token;
  final int? expiresIn;
  final int? expiresTime;
  final String? refreshToken;

  AuthResponse({
    this.token,
    this.expiresIn,
    this.expiresTime,
    this.refreshToken,
  });

  factory AuthResponse.fromRawJson(String str) => AuthResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        token: json["token"],
        expiresIn: json["expiresIn"],
        expiresTime: json["expiresTime"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "expiresIn": expiresIn,
        "expiresTime": expiresTime,
        "refreshToken": refreshToken,
      };
}
