part of '../../ioc_contact_request.dart';

class ContactClue {
  int? contactClueId;
  int? tangentCustomerId;
  String? position;
  String? fullName;
  String? phone;
  String? gender;
  String? email;

  int? contactCustomerId;
  int? resultContact;
  DateTime? contactLiveTime;
  int? status;
  String? contactCustomerContent;
  int? contactTimes;
  String? clueName;
  String? cluePosition;
  String? cluePhone;
  bool? isApproved;
  String? reasonReject;
  List<ConstructionImageInfo>? lstAttachFile;
  String? reasonFail;
  CollectProject? collectProjectInformation;

  ContactClue({
    this.contactClueId,
    this.tangentCustomerId,
    this.position,
    this.fullName,
    this.phone,
    this.gender,
    this.email,
    this.contactCustomerId,
    this.resultContact,
    this.contactLiveTime,
    this.status,
    this.contactCustomerContent,
    this.contactTimes,
    this.clueName,
    this.cluePosition,
    this.cluePhone,
    this.isApproved,
    this.lstAttachFile,
    this.reasonReject,
    this.reasonFail,
    this.collectProjectInformation,
  });

factory ContactClue.fromJson(Map<String, dynamic> json) {
    return ContactClue(
      contactClueId: json['contactClueId'],
      tangentCustomerId: json['tangentCustomerId'],
      position: json['position'],
      fullName: json['fullName'],
      phone: json['phone'],
      gender: json['gender'],
      email: json['email'],
      contactCustomerId: json['contactCustomerId'],
      resultContact: json['resultContact'],
      contactLiveTime: json['contactLiveTime'] != null ? DateTime.parse(json['contactLiveTime']) : null,
      status: json['status'],
      contactCustomerContent: json['contactCustomerContent'],
      contactTimes: json['contactTimes'],
      clueName: json['clueName'],
      cluePosition: json['cluePosition'],
      cluePhone: json['cluePhone'],
      isApproved: json['isApproved'],
      lstAttachFile: json['lstAttachFile'] != null ? List<ConstructionImageInfo>.from(json['lstAttachFile'].map((x) => ConstructionImageInfo.fromJson(x))) : null,
      reasonReject: json['reasonReject'],
      reasonFail: json['reasonFail'],
      collectProjectInformation: json['collectProjectInformation'] != null ? CollectProject.fromJson(json['collectProjectInformation']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contactClueId'] = contactClueId;
    data['tangentCustomerId'] = tangentCustomerId;
    data['position'] = position;
    data['fullName'] = fullName;
    data['phone'] = phone;
    data['gender'] = gender;
    data['email'] = email;
    data['contactCustomerId'] = contactCustomerId;
    data['resultContact'] = resultContact;
    data['contactLiveTime'] = contactLiveTime?.toIso8601String();
    data['status'] = status;
    data['contactCustomerContent'] = contactCustomerContent;
    data['contactTimes'] = contactTimes;
    data['clueName'] = clueName;
    data['cluePosition'] = cluePosition;
    data['cluePhone'] = cluePhone;
    data['isApproved'] = isApproved;
    if (lstAttachFile != null) {
      data['lstAttachFile'] = lstAttachFile!.map((v) => v.toJson()).toList();
    }
    data['reasonReject'] = reasonReject;
    data['reasonFail'] = reasonFail;
    if (collectProjectInformation != null) {
      data['collectProjectInformation'] = collectProjectInformation!.toJson();
    }
    return data;
  }

}
