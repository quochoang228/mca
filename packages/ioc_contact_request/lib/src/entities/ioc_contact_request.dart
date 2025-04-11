part of '../../ioc_contact_request.dart';

class IocContactRequest {
  final int? tangentCustomerId;
  final String? tangentCode;
  final int? type;
  final String? customerName;
  final String? customerPhone;
  final String? customerIdentification;
  final int? areaId;
  final int? provinceId;
  final String? provinceName;
  final String? districtName;
  final String? communeName;
  final String? address;
  final DateTime? suggestTime;
  final int? performerId;
  final String? status;
  final int? createdUser;
  final int? updatedUser;
  final String? partnerCode;
  final int? partnerId;
  final String? state;
  final String? createdDateStr;
  final String? updatedDateStr;
  final String? suggestTimeStr;
  final String? typeStr;
  final String? stateStr;
  final bool? isDesign;
  final DateTime? endDate;
  final String? performerName;
  final String? performerPhone;
  final int? contactTime;
  final String? provinceCode;
  final String? branch;
  final String? customerType;
  final int? performerGroupId;
  final String? performerGroupName;
  final String? branchName;
  final List<ListContactCustomer>? listContactCustomer;
  final CollectProjectInformation? collectProjectInformation;
  final bool? isRoleApprove;
  final String? stateOldCustomer;
  final String? dataResources;
  final String? surveyRequirementCode;
  final String? surveyRequirementState;
  final int? completeSurvey;
  final String? deepLink;
  final String? partnerGroupCode;
  final String? partnerTypeCode;
  final String? partnerGroupName;
  final String? partnerTypeName;
  final BidResult? bidResult;
  final String? designRequirementCode;
  final String? designRequirementState;

  int? customerGender;
  int? customerIdentificationType;
  String? placeOfIssue;
  String? specificConstructionProvince;
  String? specificConstructionDistrict;
  String? specificConstructionCommune;
  String? specificAddressDetail;
  String? modelOfTheBuilder;
  String? items;
  String? estimatedBudget;
  String? receptionChannel;
  String? customerResources;
  String? source;
  int? updatedDate;

  String? parentState;

  String? completeStatus;
  DateTime? createdDate;

  DateTime? dateOfBirth;
  DateTime? dateOfIssue;
  DateTime? estimatedConstructionTime;
  String? contentCustomer;
  String? modelOfTheBuilderDescription;
  String? itemsDescription;
  String? receptionChannelDescription;
  String? customerResourcesDescription;
  String? userNameAio;
  List<ConstructionImageInfo>? lstAttachFile;
  List<StateInfo>? stateInfoList;
  int? patkContractId;

  int? customerId;
  int? individualId;
  int? organizationId;
  String? dataSource;
  bool? verified;
  bool? isB2b;
  String? buildingValue;
  // BiddingEntity bidResult;

  String? dataDvqt;
  String? oldCustomerCode;
  String? bankAccountName;
  String? bankAccountNumber;
  String? bankName;
  int? hourModelConsultationCount;
  bool? isEncryptCustomerPhone;
  String? tangentCodeNew;

  IocContactRequest({
    this.tangentCustomerId,
    this.tangentCode,
    this.type,
    this.customerName,
    this.customerPhone,
    this.customerIdentification,
    this.areaId,
    this.provinceId,
    this.provinceName,
    this.districtName,
    this.communeName,
    this.address,
    this.suggestTime,
    this.performerId,
    this.status,
    this.createdUser,
    this.updatedUser,
    this.partnerCode,
    this.partnerId,
    this.state,
    this.createdDateStr,
    this.updatedDateStr,
    this.suggestTimeStr,
    this.typeStr,
    this.stateStr,
    this.isDesign,
    this.endDate,
    this.performerName,
    this.performerPhone,
    this.contactTime,
    this.provinceCode,
    this.branch,
    this.customerType,
    this.performerGroupId,
    this.performerGroupName,
    this.branchName,
    this.listContactCustomer,
    this.collectProjectInformation,
    this.isRoleApprove,
    this.stateOldCustomer,
    this.dataResources,
    this.surveyRequirementCode,
    this.surveyRequirementState,
    this.completeSurvey,
    this.deepLink,
    this.partnerGroupCode,
    this.partnerTypeCode,
    this.partnerGroupName,
    this.partnerTypeName,
    this.bidResult,
    this.designRequirementCode,
    this.designRequirementState,
    this.customerGender,
    this.customerIdentificationType,
    this.placeOfIssue,
    this.specificConstructionProvince,
    this.specificConstructionDistrict,
    this.specificConstructionCommune,
    this.specificAddressDetail,
    this.modelOfTheBuilder,
    this.items,
    this.estimatedBudget,
    this.receptionChannel,
    this.customerResources,
    this.source,
    this.updatedDate,
    this.parentState,
    this.completeStatus,
    this.createdDate,
    this.dateOfBirth,
    this.dateOfIssue,
    this.estimatedConstructionTime,
    this.contentCustomer,
    this.modelOfTheBuilderDescription,
    this.itemsDescription,
    this.receptionChannelDescription,
    this.customerResourcesDescription,
    this.userNameAio,
    this.lstAttachFile,
    this.stateInfoList,
    this.patkContractId,
    this.customerId,
    this.individualId,
    this.organizationId,
    this.dataSource,
    this.verified,
    this.isB2b,
    this.buildingValue,
    this.dataDvqt,
    this.oldCustomerCode,
    this.bankAccountName,
    this.bankAccountNumber,
    this.bankName,
    this.hourModelConsultationCount,
    this.isEncryptCustomerPhone,
    this.tangentCodeNew,
  });

  factory IocContactRequest.fromJson(String str) => IocContactRequest.fromMap(json.decode(str));



  factory IocContactRequest.fromMap(Map<String, dynamic> json) => IocContactRequest(
  tangentCustomerId: json["tangentCustomerId"],
  tangentCode: json["tangentCode"],
  type: json["type"],
  customerName: json["customerName"],
  customerPhone: json["customerPhone"],
  customerIdentification: json["customerIdentification"],
  areaId: json["areaId"],
  provinceId: json["provinceId"],
  provinceName: json["provinceName"],
  districtName: json["districtName"],
  communeName: json["communeName"],
  address: json["address"],
  suggestTime: json["suggestTime"] == null ? null : DateTime.parse(json["suggestTime"]),
  performerId: json["performerId"],
  status: json["status"],
  createdUser: json["createdUser"],
  updatedUser: json["updatedUser"],
  partnerCode: json["partnerCode"],
  partnerId: json["partnerId"],
  state: json["state"],
  createdDateStr: json["createdDateStr"],
  updatedDateStr: json["updatedDateStr"],
  suggestTimeStr: json["suggestTimeStr"],
  typeStr: json["typeStr"],
  stateStr: json["stateStr"],
  isDesign: json["isDesign"],
  endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
  performerName: json["performerName"],
  performerPhone: json["performerPhone"],
  contactTime: json["contactTime"],
  provinceCode: json["provinceCode"],
  branch: json["branch"],
  customerType: json["customerType"],
  performerGroupId: json["performerGroupId"],
  performerGroupName: json["performerGroupName"],
  branchName: json["branchName"],
  listContactCustomer: json["listContactCustomer"] == null ? [] : List<ListContactCustomer>.from(json["listContactCustomer"]!.map((x) => ListContactCustomer.fromJson(x))),
  collectProjectInformation: json["collectProjectInformation"] == null ? null : CollectProjectInformation.fromJson(json["collectProjectInformation"]),
  isRoleApprove: json["isRoleApprove"],
  stateOldCustomer: json["stateOldCustomer"],
  dataResources: json["dataResources"],
  surveyRequirementCode: json["surveyRequirementCode"],
  surveyRequirementState: json["surveyRequirementState"],
  completeSurvey: json["completeSurvey"],
  deepLink: json["deepLink"],
  partnerGroupCode: json["partnerGroupCode"],
  partnerTypeCode: json["partnerTypeCode"],
  partnerGroupName: json["partnerGroupName"],
  partnerTypeName: json["partnerTypeName"],
  bidResult: json["bidResult"] == null ? null : BidResult.fromJson(json["bidResult"]),
  designRequirementCode: json["designRequirementCode"],
  designRequirementState: json["designRequirementState"],
  customerGender: json["customerGender"],
  customerIdentificationType: json["customerIdentificationType"],
  placeOfIssue: json["placeOfIssue"],
  specificConstructionProvince: json["specificConstructionProvince"],
  specificConstructionDistrict: json["specificConstructionDistrict"],
  specificConstructionCommune: json["specificConstructionCommune"],
  specificAddressDetail: json["specificAddressDetail"],
  modelOfTheBuilder: json["modelOfTheBuilder"],
  items: json["items"],
  estimatedBudget: json["estimatedBudget"],
  receptionChannel: json["receptionChannel"],
  customerResources: json["customerResources"],
  source: json["source"],
  updatedDate: json["updatedDate"],
  parentState: json["parentState"],
  completeStatus: json["completeStatus"],
  createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
  dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
  dateOfIssue: json["dateOfIssue"] == null ? null : DateTime.parse(json["dateOfIssue"]),
  estimatedConstructionTime: json["estimatedConstructionTime"] == null ? null : DateTime.parse(json["estimatedConstructionTime"]),
  contentCustomer: json["contentCustomer"],
  modelOfTheBuilderDescription: json["modelOfTheBuilderDescription"],
  itemsDescription: json["itemsDescription"],
  receptionChannelDescription: json["receptionChannelDescription"],
  customerResourcesDescription: json["customerResourcesDescription"],
  userNameAio: json["userNameAio"],
  lstAttachFile: json["lstAttachFile"] == null ? [] : List<ConstructionImageInfo>.from(json["lstAttachFile"]!.map((x) => ConstructionImageInfo.fromJson(x))),
  stateInfoList: json["stateInfoList"] == null ? [] : List<StateInfo>.from(json["stateInfoList"]!.map((x) => StateInfo.fromJson(x))),
  patkContractId: json["patkContractId"],
  customerId: json["customerId"],
  individualId: json["individualId"],
  organizationId: json["organizationId"],
  dataSource: json["dataSource"],
  verified: json["verified"],
  isB2b: json["isB2b"],
  buildingValue: json["buildingValue"],
  dataDvqt: json["dataDvqt"],
  oldCustomerCode: json["oldCustomerCode"],
  bankAccountName: json["bankAccountName"],
  bankAccountNumber: json["bankAccountNumber"],
  bankName: json["bankName"],
  hourModelConsultationCount: json["hourModelConsultationCount"],
  isEncryptCustomerPhone: json["isEncryptCustomerPhone"],
  tangentCodeNew: json["tangentCodeNew"],
);

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "tangentCustomerId": tangentCustomerId,
        "tangentCode": tangentCode,
        "type": type,
        "customerName": customerName,
        "customerPhone": customerPhone,
        "customerIdentification": customerIdentification,
        "areaId": areaId,
        "provinceId": provinceId,
        "provinceName": provinceName,
        "districtName": districtName,
        "communeName": communeName,
        "address": address,
        "suggestTime": suggestTime?.toIso8601String(),
        "performerId": performerId,
        "status": status,
        "createdUser": createdUser,
        "updatedUser": updatedUser,
        "partnerCode": partnerCode,
        "partnerId": partnerId,
        "state": state,
        "createdDateStr": createdDateStr,
        "updatedDateStr": updatedDateStr,
        "suggestTimeStr": suggestTimeStr,
        "typeStr": typeStr,
        "stateStr": stateStr,
        "isDesign": isDesign,
        "endDate": endDate?.toIso8601String(),
        "performerName": performerName,
        "performerPhone": performerPhone,
        "contactTime": contactTime,
        "provinceCode": provinceCode,
        "branch": branch,
        "customerType": customerType,
        "performerGroupId": performerGroupId,
        "performerGroupName": performerGroupName,
        "branchName": branchName,
        "listContactCustomer": listContactCustomer == null ? [] : List<dynamic>.from(listContactCustomer!.map((x) => x.toJson())),
        "collectProjectInformation": collectProjectInformation?.toJson(),
        "isRoleApprove": isRoleApprove,
        "stateOldCustomer": stateOldCustomer,
        "dataResources": dataResources,
        "surveyRequirementCode": surveyRequirementCode,
        "surveyRequirementState": surveyRequirementState,
        "completeSurvey": completeSurvey,
        "deepLink": deepLink,
        "partnerGroupCode": partnerGroupCode,
        "partnerTypeCode": partnerTypeCode,
        "partnerGroupName": partnerGroupName,
        "partnerTypeName": partnerTypeName,
        "bidResult": bidResult?.toJson(),
        "designRequirementCode": designRequirementCode,
        "designRequirementState": designRequirementState,
    "customerGender": customerGender,
    "customerIdentificationType": customerIdentificationType,
    "placeOfIssue": placeOfIssue,
    "specificConstructionProvince": specificConstructionProvince,
    "specificConstructionDistrict": specificConstructionDistrict,
    "specificConstructionCommune": specificConstructionCommune,
    "specificAddressDetail": specificAddressDetail,
    "modelOfTheBuilder": modelOfTheBuilder,
    "items": items,
    "estimatedBudget": estimatedBudget,
    "receptionChannel": receptionChannel,
    "customerResources": customerResources,
    "source": source,
    "updatedDate": updatedDate,
    "parentState": parentState,
    "completeStatus": completeStatus,
    "createdDate": createdDate?.toIso8601String(),
    "dateOfBirth": dateOfBirth?.toIso8601String(),
    "dateOfIssue": dateOfIssue?.toIso8601String(),
    "estimatedConstructionTime": estimatedConstructionTime?.toIso8601String(),
    "contentCustomer": contentCustomer,
    "modelOfTheBuilderDescription": modelOfTheBuilderDescription,
    "itemsDescription": itemsDescription,
    "receptionChannelDescription": receptionChannelDescription,
    "customerResourcesDescription": customerResourcesDescription,
    "userNameAio": userNameAio,
    "lstAttachFile": lstAttachFile == null ? [] : List<dynamic>.from(lstAttachFile!.map((x) => x.toJson())),
    "stateInfoList": stateInfoList == null ? [] : List<dynamic>.from(stateInfoList!.map((x) => x.toJson())),
    "patkContractId": patkContractId,
    "customerId": customerId,
    "individualId": individualId,
    "organizationId": organizationId,
    "dataSource": dataSource,
    "verified": verified,
    "isB2b": isB2b,
    "buildingValue": buildingValue,
    "dataDvqt": dataDvqt,
    "oldCustomerCode": oldCustomerCode,
    "bankAccountName": bankAccountName,
    "bankAccountNumber": bankAccountNumber,
    "bankName": bankName,
    "hourModelConsultationCount": hourModelConsultationCount,
    "isEncryptCustomerPhone": isEncryptCustomerPhone,
    "tangentCodeNew": tangentCodeNew,
      };
}

class BidResult {
  final dynamic bidResultId;
  final dynamic performerId;
  final dynamic performerName;
  final dynamic tangentCustomerId;
  final dynamic startDate;
  final dynamic startDateStr;
  final dynamic resultUpdateDeadline;
  final dynamic resultUpdateDeadlineStr;
  final dynamic bidValue;
  final dynamic submissionDate;
  final dynamic progressStatus;
  final dynamic bidResultValue;
  final dynamic failureReason;
  final dynamic createdDate;
  final dynamic createdDateStr;
  final dynamic createdBy;
  final dynamic updatedDate;
  final dynamic updatedDateStr;
  final dynamic updatedBy;
  final dynamic state;
  final dynamic reasonExtend;
  final dynamic action;
  final dynamic status;
  final dynamic tangentState;
  final dynamic countExtendNumber;
  final dynamic newUpdateDate;
  final dynamic reasonRefuse;
  final dynamic isHavePermissionApprove;

  BidResult({
    this.bidResultId,
    this.performerId,
    this.performerName,
    this.tangentCustomerId,
    this.startDate,
    this.startDateStr,
    this.resultUpdateDeadline,
    this.resultUpdateDeadlineStr,
    this.bidValue,
    this.submissionDate,
    this.progressStatus,
    this.bidResultValue,
    this.failureReason,
    this.createdDate,
    this.createdDateStr,
    this.createdBy,
    this.updatedDate,
    this.updatedDateStr,
    this.updatedBy,
    this.state,
    this.reasonExtend,
    this.action,
    this.status,
    this.tangentState,
    this.countExtendNumber,
    this.newUpdateDate,
    this.reasonRefuse,
    this.isHavePermissionApprove,
  });

  factory BidResult.fromRawJson(String str) => BidResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BidResult.fromJson(Map<String, dynamic> json) => BidResult(
        bidResultId: json["bidResultId"],
        performerId: json["performerId"],
        performerName: json["performerName"],
        tangentCustomerId: json["tangentCustomerId"],
        startDate: json["startDate"],
        startDateStr: json["startDateStr"],
        resultUpdateDeadline: json["resultUpdateDeadline"],
        resultUpdateDeadlineStr: json["resultUpdateDeadlineStr"],
        bidValue: json["bidValue"],
        submissionDate: json["submissionDate"],
        progressStatus: json["progressStatus"],
        bidResultValue: json["bidResultValue"],
        failureReason: json["failureReason"],
        createdDate: json["createdDate"],
        createdDateStr: json["createdDateStr"],
        createdBy: json["createdBy"],
        updatedDate: json["updatedDate"],
        updatedDateStr: json["updatedDateStr"],
        updatedBy: json["updatedBy"],
        state: json["state"],
        reasonExtend: json["reasonExtend"],
        action: json["action"],
        status: json["status"],
        tangentState: json["tangentState"],
        countExtendNumber: json["countExtendNumber"],
        newUpdateDate: json["newUpdateDate"],
        reasonRefuse: json["reasonRefuse"],
        isHavePermissionApprove: json["isHavePermissionApprove"],
      );

  Map<String, dynamic> toJson() => {
        "bidResultId": bidResultId,
        "performerId": performerId,
        "performerName": performerName,
        "tangentCustomerId": tangentCustomerId,
        "startDate": startDate,
        "startDateStr": startDateStr,
        "resultUpdateDeadline": resultUpdateDeadline,
        "resultUpdateDeadlineStr": resultUpdateDeadlineStr,
        "bidValue": bidValue,
        "submissionDate": submissionDate,
        "progressStatus": progressStatus,
        "bidResultValue": bidResultValue,
        "failureReason": failureReason,
        "createdDate": createdDate,
        "createdDateStr": createdDateStr,
        "createdBy": createdBy,
        "updatedDate": updatedDate,
        "updatedDateStr": updatedDateStr,
        "updatedBy": updatedBy,
        "state": state,
        "reasonExtend": reasonExtend,
        "action": action,
        "status": status,
        "tangentState": tangentState,
        "countExtendNumber": countExtendNumber,
        "newUpdateDate": newUpdateDate,
        "reasonRefuse": reasonRefuse,
        "isHavePermissionApprove": isHavePermissionApprove,
      };
}

class CollectProjectInformation {
  final int? collectProjectInformationId;
  final int? tangentCustomerId;
  final DateTime? contactLiveDate;
  final DateTime? createdDate;
  final int? createdBy;
  final DateTime? updatedDate;
  final int? updatedBy;
  final int? status;
  final String? totalInvestment;
  final String? contactCustomerContent;
  final String? branch;
  final String? field;
  final String? career;
  final int? areaId;
  final int? provinceId;
  final String? provinceName;
  final String? districtName;
  final String? communeName;
  final String? address;
  final String? projectName;
  final String? projectStatus;
  final String? referralSource;
  final String? itemDeployment;
  final int? updateFrequency;
  final String? dataResources;

  CollectProjectInformation({
    this.collectProjectInformationId,
    this.tangentCustomerId,
    this.contactLiveDate,
    this.createdDate,
    this.createdBy,
    this.updatedDate,
    this.updatedBy,
    this.status,
    this.totalInvestment,
    this.contactCustomerContent,
    this.branch,
    this.field,
    this.career,
    this.areaId,
    this.provinceId,
    this.provinceName,
    this.districtName,
    this.communeName,
    this.address,
    this.projectName,
    this.projectStatus,
    this.referralSource,
    this.itemDeployment,
    this.updateFrequency,
    this.dataResources,
  });

  factory CollectProjectInformation.fromRawJson(String str) => CollectProjectInformation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CollectProjectInformation.fromJson(Map<String, dynamic> json) => CollectProjectInformation(
        collectProjectInformationId: json["collectProjectInformationId"],
        tangentCustomerId: json["tangentCustomerId"],
        contactLiveDate: json["contactLiveDate"] == null ? null : DateTime.parse(json["contactLiveDate"]),
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        createdBy: json["createdBy"],
        updatedDate: json["updatedDate"] == null ? null : DateTime.parse(json["updatedDate"]),
        updatedBy: json["updatedBy"],
        status: json["status"],
        totalInvestment: json["totalInvestment"],
        contactCustomerContent: json["contactCustomerContent"],
        branch: json["branch"],
        field: json["field"],
        career: json["career"],
        areaId: json["areaId"],
        provinceId: json["provinceId"],
        provinceName: json["provinceName"],
        districtName: json["districtName"],
        communeName: json["communeName"],
        address: json["address"],
        projectName: json["projectName"],
        projectStatus: json["projectStatus"],
        referralSource: json["referralSource"],
        itemDeployment: json["itemDeployment"],
        updateFrequency: json["updateFrequency"],
        dataResources: json["dataResources"],
      );

  Map<String, dynamic> toJson() => {
        "collectProjectInformationId": collectProjectInformationId,
        "tangentCustomerId": tangentCustomerId,
        "contactLiveDate": contactLiveDate?.toIso8601String(),
        "createdDate": createdDate?.toIso8601String(),
        "createdBy": createdBy,
        "updatedDate": updatedDate?.toIso8601String(),
        "updatedBy": updatedBy,
        "status": status,
        "totalInvestment": totalInvestment,
        "contactCustomerContent": contactCustomerContent,
        "branch": branch,
        "field": field,
        "career": career,
        "areaId": areaId,
        "provinceId": provinceId,
        "provinceName": provinceName,
        "districtName": districtName,
        "communeName": communeName,
        "address": address,
        "projectName": projectName,
        "projectStatus": projectStatus,
        "referralSource": referralSource,
        "itemDeployment": itemDeployment,
        "updateFrequency": updateFrequency,
        "dataResources": dataResources,
      };
}

class ListContactCustomer {
  final int? contactCustomerId;
  final int? tangentCustomerId;
  final int? resultContact;
  final DateTime? contactLiveTime;
  final DateTime? createdDate;
  final int? createdBy;
  final int? status;
  final List<dynamic>? lstAttachFile;
  final String? contactCustomerContent;
  final bool? flag;
  final String? clueName;
  final String? cluePosition;
  final String? cluePhone;

  ListContactCustomer({
    this.contactCustomerId,
    this.tangentCustomerId,
    this.resultContact,
    this.contactLiveTime,
    this.createdDate,
    this.createdBy,
    this.status,
    this.lstAttachFile,
    this.contactCustomerContent,
    this.flag,
    this.clueName,
    this.cluePosition,
    this.cluePhone,
  });

  factory ListContactCustomer.fromRawJson(String str) => ListContactCustomer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListContactCustomer.fromJson(Map<String, dynamic> json) => ListContactCustomer(
        contactCustomerId: json["contactCustomerId"],
        tangentCustomerId: json["tangentCustomerId"],
        resultContact: json["resultContact"],
        contactLiveTime: json["contactLiveTime"] == null ? null : DateTime.parse(json["contactLiveTime"]),
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        createdBy: json["createdBy"],
        status: json["status"],
        lstAttachFile: json["lstAttachFile"] == null ? [] : List<dynamic>.from(json["lstAttachFile"]!.map((x) => x)),
        contactCustomerContent: json["contactCustomerContent"],
        flag: json["flag"],
        clueName: json["clueName"],
        cluePosition: json["cluePosition"],
        cluePhone: json["cluePhone"],
      );

  Map<String, dynamic> toJson() => {
        "contactCustomerId": contactCustomerId,
        "tangentCustomerId": tangentCustomerId,
        "resultContact": resultContact,
        "contactLiveTime": contactLiveTime?.toIso8601String(),
        "createdDate": createdDate?.toIso8601String(),
        "createdBy": createdBy,
        "status": status,
        "lstAttachFile": lstAttachFile == null ? [] : List<dynamic>.from(lstAttachFile!.map((x) => x)),
        "contactCustomerContent": contactCustomerContent,
        "flag": flag,
        "clueName": clueName,
        "cluePosition": cluePosition,
        "cluePhone": cluePhone,
      };
}