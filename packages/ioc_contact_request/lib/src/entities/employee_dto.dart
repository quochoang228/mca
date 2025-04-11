part of '../../ioc_contact_request.dart';

class EmployeeDto {
  String? phoneNumber;
  String? email;
  String? employeeCode;
  String? fullName;
  String? userName;
  int? sysUserId;
  String? positionName;
  int? catPartnerId;
  String? code;
  String? name;
  String? taxCode;
  String? phone;
  String? address;
  String? description;
  int? status;
  String? provinceCode;
  String? provinceName;
  String? districtName;
  String? communeName;
  int? partnerType;
  int? provinceId;
  int? areaId;
  DateTime? birthDay;

  bool? isSelected;

  EmployeeDto({
    this.phoneNumber,
    this.employeeCode,
    this.fullName,
    this.sysUserId,
    this.positionName,
    this.catPartnerId,
    this.code,
    this.name,
    this.taxCode,
    this.phone,
    this.address,
    this.description,
    this.status,
    this.provinceCode,
    this.provinceName,
    this.districtName,
    this.communeName,
    this.email,
    this.partnerType,
    this.provinceId,
    this.areaId,
    this.birthDay,
    this.isSelected,
    this.userName,
  });

  factory EmployeeDto.fromJson(Map<String, dynamic> json) {
    return EmployeeDto(
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      employeeCode: json['employeeCode'],
      fullName: json['fullName'],
      userName: json['userName'],
      sysUserId: json['sysUserId'],
      positionName: json['positionName'],
      catPartnerId: json['catPartnerId'],
      code: json['code'],
      name: json['name'],
      taxCode: json['taxCode'],
      phone: json['phone'],
      address: json['address'],
      description: json['description'],
      status: json['status'],
      provinceCode: json['provinceCode'],
      provinceName: json['provinceName'],
      districtName: json['districtName'],
      communeName: json['communeName'],
      partnerType: json['partnerType'],
      provinceId: json['provinceId'],
      areaId: json['areaId'],
      birthDay: json['birthDay'] != null ? DateTime.parse(json['birthDay']) : null,
      isSelected: json['isSelected'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['employeeCode'] = employeeCode;
    data['fullName'] = fullName;
    data['userName'] = userName;
    data['sysUserId'] = sysUserId;
    data['positionName'] = positionName;
    data['catPartnerId'] = catPartnerId;
    data['code'] = code;
    data['name'] = name;
    data['taxCode'] = taxCode;
    data['phone'] = phone;
    data['address'] = address;
    data['description'] = description;
    data['status'] = status;
    data['provinceCode'] = provinceCode;
    data['provinceName'] = provinceName;
    data['districtName'] = districtName;
    data['communeName'] = communeName;
    data['partnerType'] = partnerType;
    data['provinceId'] = provinceId;
    data['areaId'] = areaId;
    data['birthDay'] = birthDay?.toIso8601String();
    data['isSelected'] = isSelected;
    return data;
  }

}
