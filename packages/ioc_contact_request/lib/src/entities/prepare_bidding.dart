part of '../../ioc_contact_request.dart';

class PrepareBidding {
  int? prepareBiddingId;
  int? tangentCustomerId;
  int? resultTenderer;
  String? tendererValue;
  String? buildingValue;
  List<ConstructionImageInfo>? lstAttachFile;
  ApproveLogs? approveLogs;

  PrepareBidding({
    this.prepareBiddingId,
    this.tangentCustomerId,
    this.resultTenderer,
    this.tendererValue,
    this.buildingValue,
    this.lstAttachFile,
    this.approveLogs,
  });


  factory PrepareBidding.fromJson(Map<String, dynamic> json) {
    return PrepareBidding(
      prepareBiddingId: json['prepareBiddingId'],
      tangentCustomerId: json['tangentCustomerId'],
      resultTenderer: json['resultTenderer'],
      tendererValue: json['tendererValue'],
      buildingValue: json['buildingValue'],
      lstAttachFile: json['lstAttachFile'] != null ? (json['lstAttachFile'] as List).map((i) => ConstructionImageInfo.fromJson(i)).toList() : null,
      approveLogs: json['approveLogs'] != null ? ApproveLogs.fromJson(json['approveLogs']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prepareBiddingId'] = prepareBiddingId;
    data['tangentCustomerId'] = tangentCustomerId;
    data['resultTenderer'] = resultTenderer;
    data['tendererValue'] = tendererValue;
    data['buildingValue'] = buildingValue;
    data['lstAttachFile'] = lstAttachFile?.map((v) => v.toJson()).toList();
    data['approveLogs'] = approveLogs?.toJson();
    return data;
  }
}