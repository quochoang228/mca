part of '../../ioc_contact_request.dart';

class ApproveLogs {
  int? approvedLogsId;
  int? objectId;
  String? reasonCode;
  String? reasonName;
  String? reasonDescription;
  String? type;
  String? reasonReject;
  int? status;
  String? userActionName;
  int? userAction;
  int? tangentCustomerId;
  List<ConstructionImageInfo>? lstAttachFile;

  ApproveLogs({
    this.approvedLogsId,
    this.objectId,
    this.reasonCode,
    this.reasonName,
    this.reasonDescription,
    this.type,
    this.reasonReject,
    this.status,
    this.userActionName,
    this.userAction,
    this.tangentCustomerId,
    this.lstAttachFile,
  });

  ApproveLogs.fromJson(Map<String, dynamic> json) {
    approvedLogsId = json['approvedLogsId'];
    objectId = json['objectId'];
    reasonCode = json['reasonCode'];
    reasonName = json['reasonName'];
    reasonDescription = json['reasonDescription'];
    type = json['type'];
    reasonReject = json['reasonReject'];
    status = json['status'];
    userActionName = json['userActionName'];
    userAction = json['userAction'];
    tangentCustomerId = json['tangentCustomerId'];
    if (json['lstAttachFile'] != null) {
      lstAttachFile = <ConstructionImageInfo>[];
      json['lstAttachFile'].forEach((v) {
        lstAttachFile!.add(ConstructionImageInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['approvedLogsId'] = approvedLogsId;
    data['objectId'] = objectId;
    data['reasonCode'] = reasonCode;
    data['reasonName'] = reasonName;
    data['reasonDescription'] = reasonDescription;
    data['type'] = type;
    data['reasonReject'] = reasonReject;
    data['status'] = status;
    data['userActionName'] = userActionName;
    data['userAction'] = userAction;
    data['tangentCustomerId'] = tangentCustomerId;
    if (lstAttachFile != null) {
      data['lstAttachFile'] = lstAttachFile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}