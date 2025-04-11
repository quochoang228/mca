part of '../../ioc_contact_request.dart';

class UserInfoDto {
  String? customerName;
  String? customerPhone;
  String? customerIdentification;
  int? areaId;
  int? provinceId;
  String? provinceName;
  String? districtName;
  String? communeName;
  String? address;
  String? partnerCode;
  String? dataSource;
  bool? verified;
  int? customerId;
  int? individualId;
  int? organizationId;
  String? provinceCode;

  UserInfoDto({
    this.customerName,
    this.customerPhone,
    this.customerIdentification,
    this.areaId,
    this.provinceId,
    this.provinceName,
    this.districtName,
    this.communeName,
    this.address,
    this.partnerCode,
    this.dataSource,
    this.verified,
    this.customerId,
    this.individualId,
    this.organizationId,
    this.provinceCode,
  });

  factory UserInfoDto.fromJson(Map<String, dynamic> json) {
    return UserInfoDto(
      customerName: json['customerName'],
      customerPhone: json['customerPhone'],
      customerIdentification: json['customerIdentification'],
      areaId: json['areaId'],
      provinceId: json['provinceId'],
      provinceName: json['provinceName'],
      districtName: json['districtName'],
      communeName: json['communeName'],
      address: json['address'],
      partnerCode: json['partnerCode'],
      dataSource: json['dataSource'],
      verified: json['verified'],
      customerId: json['customerId'],
      individualId: json['individualId'],
      organizationId: json['organizationId'],
      provinceCode: json['provinceCode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerName'] = customerName;
    data['customerPhone'] = customerPhone;
    data['customerIdentification'] = customerIdentification;
    data['areaId'] = areaId;
    data['provinceId'] = provinceId;
    data['provinceName'] = provinceName;
    data['districtName'] = districtName;
    data['communeName'] = communeName;
    data['address'] = address;
    data['partnerCode'] = partnerCode;
    data['dataSource'] = dataSource;
    data['verified'] = verified;
    data['customerId'] = customerId;
    data['individualId'] = individualId;
    data['organizationId'] = organizationId;
    data['provinceCode'] = provinceCode;
    return data;
  }

  SourceInfoType get getTypeDataSource => SourceInfoTypeExtension.getType(dataSource ?? '');

  FailByType get getFailByType {
    if (verified ?? false) {
      return FailByType.none;
    } else {
      FailByType? type;

      if ((customerName ?? '').isEmpty || (customerName ?? '').length < 3 || (!(customerName ?? '').isAlphaAndSpace) || (!(customerName ?? '').trim().contains(' '))) {
        type = FailByType.name;
      }

      if ((provinceName ?? '').isEmpty || (districtName ?? '').isEmpty || (communeName ?? '').isEmpty) {
        // if (type != null) {
        //   return FailByType.all;
        // } else {
        //   return FailByType.address;
        // }

        if (type != FailByType.none) {
          return FailByType.all;
        } else {
          return FailByType.address;
        }
      } else {
        if (type != null) {
          return FailByType.name;
        }
        return FailByType.none;
      }
    }
  }

  bool get isValidateCustomerName {
    if ((customerName ?? '').isEmpty || (customerName ?? '').length < 3 || (!(customerName ?? '').isAlphaAndSpace) || (!(customerName ?? '').trim().contains(' '))) {
      return false;
    }
    return true;
  }
}
