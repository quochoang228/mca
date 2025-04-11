part of '../../ioc_contact_request.dart';

class StateInfo {
  String? state;
  String? stateName;
  String? status;
  String? performName;
  int? deadlineTime;

  StateInfo({
    this.state,
    this.stateName,
    this.status,
    this.performName,
    this.deadlineTime,
  });

  factory StateInfo.fromJson(Map<String, dynamic> json) => StateInfo(
    state: json["state"],
    stateName: json["stateName"],
    status: json["status"],
    performName: json["performName"],
    deadlineTime: json["deadlineTime"],
  );

  Map<String, dynamic> toJson() => {
    "state": state,
    "stateName": stateName,
    "status": status,
    "performName": performName,
    "deadlineTime": deadlineTime,
  };
}