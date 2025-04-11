part of '../../ioc_contact_request.dart';

class AddressSelected {
  String? addressDetail;
  String? provinceCode;
  String? wardCode;
  String? districtCode;

  int? provinceId;
  int? wardsId;
  int? districtId;

  int? idDistrict;
  int? idAreaWard;
  int? isHaveEmployee;
  String? provinceName;
  String? districtName;
  String? areaWardName;
  String? address;
  String? nameProvine2;
  String? areaWardCode;

  String? provinceCodeV2;

  AddressSelected({
    this.addressDetail,
    this.provinceCode,
    this.wardCode,
    this.districtCode,
    this.provinceId,
    this.wardsId,
    this.districtId,
    this.idDistrict,
    this.idAreaWard,
    this.isHaveEmployee,
    this.provinceName,
    this.districtName,
    this.areaWardName,
    this.address,
    this.nameProvine2,
    this.areaWardCode,
    this.provinceCodeV2,
  });

  String get getAddressDetail {
    return (address ?? '') +
        ((address ?? '').isNotEmpty ? "," : "") +
        (areaWardName ?? '') +
        ((areaWardName ?? '').isNotEmpty ? "," : "") +
        (districtName ?? '') +
        ((districtName ?? '').isNotEmpty ? "," : "") +
        (provinceName ?? '');
  }

  factory AddressSelected.fromJson(Map<String, dynamic> json) {
    return AddressSelected(
      addressDetail: json['addressDetail'],
      provinceCode: json['provinceCode'],
      wardCode: json['wardCode'],
      districtCode: json['districtCode'],
      provinceId: json['provinceId'],
      wardsId: json['wardsId'],
      districtId: json['districtId'],
      idDistrict: json['idDistrict'],
      idAreaWard: json['idAreaWard'],
      isHaveEmployee: json['isHaveEmployee'],
      provinceName: json['provinceName'],
      districtName: json['districtName'],
      areaWardName: json['areaWardName'],
      address: json['address'],
      nameProvine2: json['nameProvine2'],
      areaWardCode: json['areaWardCode'],
      provinceCodeV2: json['provinceCodeV2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addressDetail': addressDetail,
      'provinceCode': provinceCode,
      'wardCode': wardCode,
      'districtCode': districtCode,
      'provinceId': provinceId,
      'wardsId': wardsId,
      'districtId': districtId,
      'idDistrict': idDistrict,
      'idAreaWard': idAreaWard,
      'isHaveEmployee': isHaveEmployee,
      'provinceName': provinceName,
      'districtName': districtName,
      'areaWardName': areaWardName,
      'address': address,
      'nameProvine2': nameProvine2,
      'areaWardCode': areaWardCode,
      'provinceCodeV2': provinceCodeV2,
    };
  }
}
