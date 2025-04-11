part of '../../../../ioc_contact_request.dart';

enum AIIocContactRequestB2CFieldNames {
  roomType('Loại phòng'),
  stylishDesign('Phong cách thiết kế'),
  roofType('Kiểm mái'),
  numberOfFloors('Số tầng'),
  imageTotal('Số ảnh hiển thị'),
  describe('Mô tả');

  const AIIocContactRequestB2CFieldNames(this.title);
  final String title;
}

class AIIocContactRequestB2CState {
  List<AppParam>? listRoofType = <AppParam>[];
  List<AppParam>? listStylishDesign = <AppParam>[];
  final bool? isLoading;
  final String? error;

  AIIocContactRequestB2CState({
    this.listRoofType,
    this.listStylishDesign,
    this.isLoading = false,
    this.error,
  });

  AIIocContactRequestB2CState copyWith({
    List<AppParam>? listRoofType,
    List<AppParam>? listStylishDesign,
    bool? isLoading,
    String? error,
  }) {
    return AIIocContactRequestB2CState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      listStylishDesign: listStylishDesign ?? this.listStylishDesign,
      listRoofType: listRoofType ?? this.listRoofType,
    );
  }
}
