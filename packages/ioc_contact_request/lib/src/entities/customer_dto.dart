part of '../../ioc_contact_request.dart';

class CustomerDto {
  int? catPartnerId;
  String? code;
  String? name;

  CustomerDto({
    this.catPartnerId,
    this.code,
    this.name,
  });

  factory CustomerDto.fromJson(Map<String, dynamic> json) {
    return CustomerDto(
      catPartnerId: json['catPartnerId'],
      code: json['code'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['catPartnerId'] = catPartnerId;
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}
