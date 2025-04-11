part of '../../../../ioc_contact_request.dart';

enum IocContactRequestB2CFieldNames {
  receptionChannel('Kênh tiếp nhận'),
  receptionChannelDescription('Kênh tiếp nhận khác'),
  source('Kênh ghi nhận'),
  customerResources('Nguồn thông tin khách hàng'),
  customerResourcesDescription('Chi tiết nguồn khách hàng khác'),
  time('Thời gian liên hệ khách hàng'),
  nhansu('Nhân sự phụ trách'),

  recruitmentType('Loại tuyển dụng');

  const IocContactRequestB2CFieldNames(this.title);
  final String title;
}

class IocContactRequestB2CDetailState {
  final IocContactRequest detail;
  IocContactRequest? currentContact = IocContactRequest();
  final bool? isLoading;
  final String? error;

  AddressSelected? addressCustomer = AddressSelected();
  AddressSelected? addressSpecificConstruction = AddressSelected();
  AddressSelected? addressSpecificConstructionLive = AddressSelected();
  DateTime? dateOfIssue;
  DateTime? dateOfBirth;
  DateTime? estimatedConstructionTime;
  DateTime? suggestTime;
  DateTime? suggestTime2;
  DateTime? suggestTime3;
  List<AppParam>? listSpecificConstruction;
  List<AppParam>? listSpecificConstructionB2B;
  List<AppParam>? listModelOfTheBuilder;
  List<AppParam>? listReceptionChannel;
  List<AppParam>? listSourceYCTK;
  List<AppParam>? listCustomerResources;
  List<AppParam>? listResourcesSelected;
  List<AppParam>? jobLst;
  List<AppParam>? listPerformanceType;
  List<AppParam>? listAllSourceYCTK;
  List<EmployeeDto>? listEmployee;
  List<CustomerDto>? listCustomer;
  EmployeeDto? performerResponsible;
  EmployeeDto? draftStaffSignConstruction;
  EmployeeDto? draftStaffSignDesign;
  CustomerDto? draftCusSignConstruction;
  int? typeCustomer = 1;
  List<ContactClue>? lstContactClue;
  List<ConstructionImageInfo>? listFileAttach;
  TextEditingController? campaignController = TextEditingController();
  AppParam? otherItems = AppParam();
  AppParam? otherItemsLive = AppParam();
  AppParam? otherItemsCollect = AppParam();
  AppParam? otherConstructionType = AppParam();
  AppParam? otherConstructionTypeLive = AppParam();
  AppParam? otherConstructionTypeCollect = AppParam();
  AppParam? otherReceptionChannel = AppParam();
  AppParam? source = AppParam();
  AppParam? otherCustomerResources = AppParam();
  bool? isRoleCSKH = false;
  bool? checkedRoleCSKH = false;
  bool? checkedRoleCSKH1 = false;
  Option? typeIdentitySelected = typePapers[2];
  bool? usernameReadOnly = false;
  UserInfoDto? userInfo;
  bool? isDisable = false;
  bool? isCHeckRoleSuccess = false;

  String? dataItemsDVQT = '3';
  String? dataCause = '1';
  AppParam? checkDVQT = AppParam();
  List<AppParam>? listSourceXHH = <AppParam>[];
  List<AppParam>? listUnitPriceDetail;

  // IocContactRequestB2CDetailState({
  //   required this.detail,
  //   this.isLoading = false,
  //   this.error,
  // });

  IocContactRequestB2CDetailState({
    required this.detail,
    this.isLoading = false,
    this.error,
    this.dateOfIssue,
    this.dateOfBirth,
    this.estimatedConstructionTime,
    this.suggestTime,
    this.suggestTime2,
    this.suggestTime3,
    this.listSpecificConstruction,
    this.listSpecificConstructionB2B,
    this.listModelOfTheBuilder,
    this.listReceptionChannel,
    this.listSourceYCTK,
    this.listCustomerResources,
    this.listResourcesSelected,
    this.jobLst,
    this.listPerformanceType,
    this.listAllSourceYCTK,
    this.listEmployee,
    this.listCustomer,
    this.performerResponsible,
    this.draftStaffSignConstruction,
    this.draftStaffSignDesign,
    this.draftCusSignConstruction,
    this.typeCustomer,
    this.lstContactClue,
    this.listFileAttach,
    this.campaignController,
    this.otherItems,
    this.otherItemsLive,
    this.otherItemsCollect,
    this.otherConstructionType,
    this.otherConstructionTypeLive,
    this.otherConstructionTypeCollect,
    this.otherReceptionChannel,
    this.source,
    this.otherCustomerResources,
    this.isRoleCSKH,
    this.checkedRoleCSKH,
    this.checkedRoleCSKH1,
    this.typeIdentitySelected,
    this.usernameReadOnly,
    this.userInfo,
    this.isDisable,
    this.isCHeckRoleSuccess,
    this.dataItemsDVQT,
    this.dataCause,
    this.checkDVQT,
    this.listSourceXHH,
    this.listUnitPriceDetail,
    this.addressCustomer,
    this.addressSpecificConstruction,
    this.addressSpecificConstructionLive,
    this.currentContact,
  });

  IocContactRequestB2CDetailState copyWith({
    IocContactRequest? detail,
    IocContactRequest? currentContact,
    bool? isLoading,
    String? error,
    DateTime? dateOfIssue,
    DateTime? dateOfBirth,
    DateTime? estimatedConstructionTime,
    DateTime? suggestTime,
    DateTime? suggestTime2,
    DateTime? suggestTime3,
    List<AppParam>? listSpecificConstruction,
    List<AppParam>? listSpecificConstructionB2B,
    List<AppParam>? listModelOfTheBuilder,
    List<AppParam>? listReceptionChannel,
    List<AppParam>? listSourceYCTK,
    List<AppParam>? listCustomerResources,
    List<AppParam>? listResourcesSelected,
    List<AppParam>? jobLst,
    List<AppParam>? listPerformanceType,
    List<AppParam>? listAllSourceYCTK,
    List<EmployeeDto>? listEmployee,
    List<CustomerDto>? listCustomer,
    EmployeeDto? performerResponsible,
    EmployeeDto? draftStaffSignConstruction,
    EmployeeDto? draftStaffSignDesign,
    CustomerDto? draftCusSignConstruction,
    int? typeCustomer,
    List<ContactClue>? lstContactClue,
    List<ConstructionImageInfo>? listFileAttach,
    TextEditingController? campaignController,
    AppParam? otherItems,
    AppParam? otherItemsLive,
    AppParam? otherItemsCollect,
    AppParam? otherConstructionType,
    AppParam? otherConstructionTypeLive,
    AppParam? otherConstructionTypeCollect,
    AppParam? otherReceptionChannel,
    AppParam? source,
    AppParam? otherCustomerResources,
    bool? isRoleCSKH,
    bool? checkedRoleCSKH,
    bool? checkedRoleCSKH1,
    Option? typeIdentitySelected,
    bool? usernameReadOnly,
    UserInfoDto? userInfo,
    bool? isDisable,
    bool? isCHeckRoleSuccess,
    String? dataItemsDVQT,
    String? dataCause,
    AppParam? checkDVQT,
    List<AppParam>? listSourceXHH,
    List<AppParam>? listUnitPriceDetail,
    AddressSelected? addressCustomer,
    AddressSelected? addressSpecificConstruction,
    AddressSelected? addressSpecificConstructionLive,
  }) {
    return IocContactRequestB2CDetailState(
      detail: detail ?? this.detail,
      currentContact: currentContact ?? this.currentContact,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      dateOfIssue: dateOfIssue ?? this.dateOfIssue,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      estimatedConstructionTime:
          estimatedConstructionTime ?? this.estimatedConstructionTime,
      suggestTime: suggestTime ?? this.suggestTime,
      suggestTime2: suggestTime2 ?? this.suggestTime2,
      suggestTime3: suggestTime3 ?? this.suggestTime3,
      listSpecificConstruction:
          listSpecificConstruction ?? this.listSpecificConstruction,
      listSpecificConstructionB2B:
          listSpecificConstructionB2B ?? this.listSpecificConstructionB2B,
      listModelOfTheBuilder:
          listModelOfTheBuilder ?? this.listModelOfTheBuilder,
      listReceptionChannel: listReceptionChannel ?? this.listReceptionChannel,
      listSourceYCTK: listSourceYCTK ?? this.listSourceYCTK,
      listCustomerResources:
          listCustomerResources ?? this.listCustomerResources,
      listResourcesSelected:
          listResourcesSelected ?? this.listResourcesSelected,
      jobLst: jobLst ?? this.jobLst,
      listPerformanceType: listPerformanceType ?? this.listPerformanceType,
      listAllSourceYCTK: listAllSourceYCTK ?? this.listAllSourceYCTK,
      listEmployee: listEmployee ?? this.listEmployee,
      listCustomer: listCustomer ?? this.listCustomer,
      performerResponsible: performerResponsible ?? this.performerResponsible,
      draftStaffSignConstruction:
          draftStaffSignConstruction ?? this.draftStaffSignConstruction,
      draftStaffSignDesign: draftStaffSignDesign ?? this.draftStaffSignDesign,
      draftCusSignConstruction:
          draftCusSignConstruction ?? this.draftCusSignConstruction,
      typeCustomer: typeCustomer ?? this.typeCustomer,
      lstContactClue: lstContactClue ?? this.lstContactClue,
      listFileAttach: listFileAttach ?? this.listFileAttach,
      campaignController: campaignController ?? this.campaignController,
      otherItems: otherItems ?? this.otherItems,
      otherItemsLive: otherItemsLive ?? this.otherItemsLive,
      otherItemsCollect: otherItemsCollect ?? this.otherItemsCollect,
      otherConstructionType:
          otherConstructionType ?? this.otherConstructionType,
      otherConstructionTypeLive:
          otherConstructionTypeLive ?? this.otherConstructionTypeLive,
      otherConstructionTypeCollect:
          otherConstructionTypeCollect ?? this.otherConstructionTypeCollect,
      otherReceptionChannel:
          otherReceptionChannel ?? this.otherReceptionChannel,
      source: source ?? this.source,
      otherCustomerResources:
          otherCustomerResources ?? this.otherCustomerResources,
      isRoleCSKH: isRoleCSKH ?? this.isRoleCSKH,
      checkedRoleCSKH: checkedRoleCSKH ?? this.checkedRoleCSKH,
      checkedRoleCSKH1: checkedRoleCSKH1 ?? this.checkedRoleCSKH1,
      typeIdentitySelected: typeIdentitySelected ?? this.typeIdentitySelected,
      usernameReadOnly: usernameReadOnly ?? this.usernameReadOnly,
      userInfo: userInfo ?? this.userInfo,
      isDisable: isDisable ?? this.isDisable,
      isCHeckRoleSuccess: isCHeckRoleSuccess ?? this.isCHeckRoleSuccess,
      dataItemsDVQT: dataItemsDVQT ?? this.dataItemsDVQT,
      dataCause: dataCause ?? this.dataCause,
      checkDVQT: checkDVQT ?? this.checkDVQT,
      listSourceXHH: listSourceXHH ?? this.listSourceXHH,
      listUnitPriceDetail: listUnitPriceDetail ?? this.listUnitPriceDetail,
      addressCustomer: addressCustomer ?? this.addressCustomer,
      addressSpecificConstruction:
          addressSpecificConstruction ?? this.addressSpecificConstruction,
      addressSpecificConstructionLive: addressSpecificConstructionLive ??
          this.addressSpecificConstructionLive,
    );
  }
}
