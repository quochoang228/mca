part of '../../ioc_contact_request.dart';

class CollectProject {
  int? contactClueId;
  int? tangentCustomerId;
  int? resultCollect;
  DateTime? contactLiveDate;
  String? specificConstructionProvince;
  String? specificConstructionDistrict;
  String? specificConstructionCommune;
  String? specificAddressDetail;
  String? modelOfTheBuilder;
  String? items;
  DateTime? estimatedConstructionTime;
  String? contentCustomer;
  String? totalInvestment;
  int? priceVat; //tong gia tri du an truoc VAT
  List<ContactClue>? lstContactClue;
  ApproveLogs? approveLogs;
  String? modelOfTheBuilderDescription;
  String? itemsDescription;
  String? contactCustomerContent;
  String? note;

  int? collectProjectInformationId;
  int? status;

  //Trụ
  String? branch;

  //Lĩnh vực
  String? field;

  //Ngành nghề
  String? career;

  //ID xã
  int? areaId;

  //ID tỉnh
  int? provinceId;

  //Tỉnh
  String? provinceName;

  //Huyện
  String? districtName;

  //Xã
  String? communeName;

  //Địa chỉ
  String? address;

  //Tên dự án
  String? projectName;

  //Loại tham gia
  String? participationType;

  //Tình trạng dự án
  String? projectStatus;

  //Nguồn giới thiệu
  String? referralSource;

  //Hạng mục triển khai
  String? itemDeployment;

  //Tần suất cập nhật tình trạng dự án (ngày/lần)
  int? updateFrequency;
  String? reasonReject;
  String? dataResources;

  //ma goi thau/ten du an
  String? bidPackageCode;

  CollectProject({
    this.contactClueId,
    this.tangentCustomerId,
    this.resultCollect,
    this.contactLiveDate,
    this.lstContactClue,
    this.specificConstructionProvince,
    this.specificConstructionDistrict,
    this.specificConstructionCommune,
    this.specificAddressDetail,
    this.modelOfTheBuilder,
    this.items,
    this.estimatedConstructionTime,
    this.contentCustomer,
    this.totalInvestment,
    this.approveLogs,
    this.modelOfTheBuilderDescription,
    this.itemsDescription,
    this.contactCustomerContent,
    this.note,
    this.branch,
    this.provinceId,
    this.address,
    this.provinceName,
    this.areaId,
    this.communeName,
    this.districtName,
    this.field,
    this.career,
    this.collectProjectInformationId,
    this.itemDeployment,
    this.participationType,
    this.projectName,
    this.projectStatus,
    this.referralSource,
    this.status,
    this.updateFrequency,
    this.reasonReject,
    this.dataResources,
    this.priceVat,
    this.bidPackageCode,
  });

  CollectProject copyWith({
    int? contactClueId,
    int? tangentCustomerId,
    int? resultCollect,
    DateTime? contactLiveDate,
    String? specificConstructionProvince,
    String? specificConstructionDistrict,
    String? specificConstructionCommune,
    String? specificAddressDetail,
    String? modelOfTheBuilder,
    String? items,
    DateTime? estimatedConstructionTime,
    String? contentCustomer,
    String? totalInvestment,
    int? priceVat,
    List<ContactClue>? lstContactClue,
    ApproveLogs? approveLogs,
    String? modelOfTheBuilderDescription,
    String? itemsDescription,
    String? contactCustomerContent,
    int? collectProjectInformationId,
    int? status,
    String? branch,
    String? field,
    String? career,
    int? areaId,
    int? provinceId,
    String? provinceName,
    String? districtName,
    String? communeName,
    String? address,
    String? projectName,
    String? participationType,
    String? projectStatus,
    String? referralSource,
    String? itemDeployment,
    int? updateFrequency,
    String? reasonReject,
    String? dataResources,
    String? bidPackageCode,
  }) =>
      CollectProject(
        contactClueId: contactClueId ?? this.contactClueId,
        tangentCustomerId: tangentCustomerId ?? this.tangentCustomerId,
        resultCollect: resultCollect ?? this.resultCollect,
        contactLiveDate: contactLiveDate ?? this.contactLiveDate,
        lstContactClue: lstContactClue ?? this.lstContactClue,
        specificConstructionProvince: specificConstructionProvince ?? this.specificConstructionProvince,
        specificConstructionDistrict: specificConstructionDistrict ?? this.specificConstructionDistrict,
        specificConstructionCommune: specificConstructionCommune ?? this.specificConstructionCommune,
        specificAddressDetail: specificAddressDetail ?? this.specificAddressDetail,
        modelOfTheBuilder: modelOfTheBuilder ?? this.modelOfTheBuilder,
        items: items ?? this.items,
        estimatedConstructionTime: estimatedConstructionTime ?? this.estimatedConstructionTime,
        contentCustomer: contentCustomer ?? this.contentCustomer,
        totalInvestment: totalInvestment ?? this.totalInvestment,
        priceVat: priceVat ?? this.priceVat,
        approveLogs: approveLogs ?? this.approveLogs,
        modelOfTheBuilderDescription: modelOfTheBuilderDescription ?? this.modelOfTheBuilderDescription,
        itemsDescription: itemsDescription ?? this.itemsDescription,
        contactCustomerContent: contactCustomerContent ?? this.contactCustomerContent,
        branch: branch ?? this.branch,
        provinceId: provinceId ?? this.provinceId,
        address: address ?? this.address,
        provinceName: provinceName ?? this.provinceName,
        areaId: areaId ?? this.areaId,
        communeName: communeName ?? this.communeName,
        districtName: districtName ?? this.districtName,
        field: field ?? this.field,
        career: career ?? this.career,
        collectProjectInformationId: collectProjectInformationId ?? this.collectProjectInformationId,
        itemDeployment: itemDeployment ?? this.itemDeployment,
        participationType: participationType ?? this.participationType,
        projectName: projectName ?? this.projectName,
        projectStatus: projectStatus ?? this.projectStatus,
        referralSource: referralSource ?? this.referralSource,
        status: status ?? this.status,
        updateFrequency: updateFrequency ?? this.updateFrequency,
        reasonReject: reasonReject ?? this.reasonReject,
        dataResources: dataResources ?? this.dataResources,
        bidPackageCode: bidPackageCode ?? this.bidPackageCode,
      );

factory CollectProject.fromJson(Map<String, dynamic> json) {
    return CollectProject(
      contactClueId: json['contactClueId'],
      tangentCustomerId: json['tangentCustomerId'],
      resultCollect: json['resultCollect'],
      contactLiveDate: json['contactLiveDate'] != null ? DateTime.parse(json['contactLiveDate']) : null,
      specificConstructionProvince: json['specificConstructionProvince'],
      specificConstructionDistrict: json['specificConstructionDistrict'],
      specificConstructionCommune: json['specificConstructionCommune'],
      specificAddressDetail: json['specificAddressDetail'],
      modelOfTheBuilder: json['modelOfTheBuilder'],
      items: json['items'],
      estimatedConstructionTime: json['estimatedConstructionTime'] != null ? DateTime.parse(json['estimatedConstructionTime']) : null,
      contentCustomer: json['contentCustomer'],
      totalInvestment: json['totalInvestment'],
      priceVat: json['priceVat'],
      lstContactClue: json['lstContactClue'] != null ? List<ContactClue>.from(json['lstContactClue'].map((x) => ContactClue.fromJson(x))) : null,
      approveLogs: json['approveLogs'] != null ? ApproveLogs.fromJson(json['approveLogs']) : null,
      modelOfTheBuilderDescription: json['modelOfTheBuilderDescription'],
      itemsDescription: json['itemsDescription'],
      contactCustomerContent: json['contactCustomerContent'],
      note: json['note'],
      branch: json['branch'],
      provinceId: json['provinceId'],
      address: json['address'],
      provinceName: json['provinceName'],
      areaId: json['areaId'],
      communeName: json['communeName'],
      districtName: json['districtName'],
      field: json['field'],
      career: json['career'],
      collectProjectInformationId: json['collectProjectInformationId'],
      itemDeployment: json['itemDeployment'],
      participationType: json['participationType'],
      projectName: json['projectName'],
      projectStatus: json['projectStatus'],
      referralSource: json['referralSource'],
      status: json['status'],
      updateFrequency: json['updateFrequency'],
      reasonReject: json['reasonReject'],
      dataResources: json['dataResources'],
      bidPackageCode: json['bidPackageCode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contactClueId'] = contactClueId;
    data['tangentCustomerId'] = tangentCustomerId;
    data['resultCollect'] = resultCollect;
    data['contactLiveDate'] = contactLiveDate?.toIso8601String();
    data['specificConstructionProvince'] = specificConstructionProvince;
    data['specificConstructionDistrict'] = specificConstructionDistrict;
    data['specificConstructionCommune'] = specificConstructionCommune;
    data['specificAddressDetail'] = specificAddressDetail;
    data['modelOfTheBuilder'] = modelOfTheBuilder;
    data['items'] = items;
    data['estimatedConstructionTime'] = estimatedConstructionTime?.toIso8601String();
    data['contentCustomer'] = contentCustomer;
    data['totalInvestment'] = totalInvestment;
    data['priceVat'] = priceVat;
    if (lstContactClue != null) {
      data['lstContactClue'] = lstContactClue!.map((v) => v.toJson()).toList();
    }
    if (approveLogs != null) {
      data['approveLogs'] = approveLogs!.toJson();
    }
    data['modelOfTheBuilderDescription'] = modelOfTheBuilderDescription;
    data['itemsDescription'] = itemsDescription;
    data['contactCustomerContent'] = contactCustomerContent;
    data['note'] = note;
    data['branch'] = branch;
    data['provinceId'] = provinceId;
    data['address'] = address;
    data['provinceName'] = provinceName;
    data['areaId'] = areaId;
    data['communeName'] = communeName;
    data['districtName'] = districtName;
    data['field'] = field;
    data['career'] = career;
    data['collectProjectInformationId'] = collectProjectInformationId;
    data['itemDeployment'] = itemDeployment;
    data['participationType'] = participationType;
    data['projectName'] = projectName;
    data['projectStatus'] = projectStatus;
    data['referralSource'] = referralSource;
    data['status'] = status;
    data['updateFrequency'] = updateFrequency;
    data['reasonReject'] = reasonReject;
    data['dataResources'] = dataResources;
    data['bidPackageCode'] = bidPackageCode;
    return data;
  }
}
