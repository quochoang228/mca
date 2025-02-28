part of '../../ioc_contact_request.dart';

class AppParam {
  final String? code;
  final String? name;
  final String? parType;
  final String? parOrder;
  final String? description;
  final int? status;

  AppParam({
    this.code,
    this.name,
    this.parType,
    this.parOrder,
    this.description,
    this.status,
  });

  factory AppParam.fromRawJson(String str) => AppParam.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppParam.fromJson(Map<String, dynamic> json) => AppParam(
    code: json["code"],
    name: json["name"],
    parType: json["parType"],
    parOrder: json["parOrder"],
    description: json["description"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "parType": parType,
    "parOrder": parOrder,
    "description": description,
    "status": status,
  };
}
