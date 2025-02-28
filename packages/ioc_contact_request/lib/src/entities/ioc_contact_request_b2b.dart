part of '../../ioc_contact_request.dart';


class IocContactRequestDto {
    final int? tangentCustomerId;
    final String? tangentCode;
    final String? customerName;
    final String? customerPhone;
    final String? address;
    final String? state;
    final String? createdDateStr;
    final String? stateStr;
    final String? completeStatus;
    final String? branch;
    final int? hourModelConsultationCount;
    final String? tangentCodeNew;

    IocContactRequestDto({
        this.tangentCustomerId,
        this.tangentCode,
        this.customerName,
        this.customerPhone,
        this.address,
        this.state,
        this.createdDateStr,
        this.stateStr,
        this.completeStatus,
        this.branch,
        this.hourModelConsultationCount,
        this.tangentCodeNew,
    });

    factory IocContactRequestDto.fromRawJson(String str) => IocContactRequestDto.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory IocContactRequestDto.fromJson(Map<String, dynamic> json) => IocContactRequestDto(
        tangentCustomerId: json["tangentCustomerId"],
        tangentCode: json["tangentCode"],
        customerName: json["customerName"],
        customerPhone: json["customerPhone"],
        address: json["address"],
        state: json["state"],
        createdDateStr: json["createdDateStr"],
        stateStr: json["stateStr"],
        completeStatus: json["completeStatus"],
        branch: json["branch"],
        hourModelConsultationCount: json["hourModelConsultationCount"],
        tangentCodeNew: json["tangentCodeNew"],
    );

    Map<String, dynamic> toJson() => {
        "tangentCustomerId": tangentCustomerId,
        "tangentCode": tangentCode,
        "customerName": customerName,
        "customerPhone": customerPhone,
        "address": address,
        "state": state,
        "createdDateStr": createdDateStr,
        "stateStr": stateStr,
        "completeStatus": completeStatus,
        "branch": branch,
        "hourModelConsultationCount": hourModelConsultationCount,
        "tangentCodeNew": tangentCodeNew,
    };
}

