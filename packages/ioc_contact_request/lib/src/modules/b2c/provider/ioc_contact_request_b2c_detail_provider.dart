part of '../../../../ioc_contact_request.dart';

final iocContactRequestB2CDetailProvider = StateNotifierProvider<IocContactRequestB2CDetailProvider, IocContactRequestB2CDetailState>(
  (ref) => IocContactRequestB2CDetailProvider(),
);

class IocContactRequestB2CDetailProvider extends StateNotifier<IocContactRequestB2CDetailState> {
  IocContactRequestB2CDetailProvider()
      : super(
          IocContactRequestB2CDetailState(
            detail: IocContactRequest(),
            isLoading: false,
          ),
        );

  Future<void> getContactDetailB2C(int? id) async {
    if (id == null) {
      state = state.copyWith(
        isLoading: false,
        detail: null,
        error: 'Kiểm tra lại dữ liệu của bạn: Không có id',
      );
    }
    state = state.copyWith(isLoading: true);
    try {
      final result = await Dependencies().getIt<IOCContactRequestRepository>().getContactDetailB2C(
        request: {
          'id': id,
        },
      );
      result.when(
        success: (data) {
          if ((data.data != null) && data.status == IOCContactRequestConstant.apiStatusSuccess) {
            state = state.copyWith(
              isLoading: false,
              detail: data.data,
              addressCustomer: AddressSelected(
                addressDetail: "${data.data?.address != null ? "${data.data?.address}, " : ''}"
                    "${data.data?.communeName}, "
                    "${data.data?.districtName}, "
                    "${data.data?.provinceName}",
                provinceId: data.data?.provinceId,
                idAreaWard: data.data?.areaId,
                provinceName: data.data?.provinceName,
                districtName: data.data?.districtName,
                areaWardName: data.data?.communeName,
                address: data.data?.address,
              ),
              addressSpecificConstruction: data.data?.specificConstructionProvince != null
                  ? AddressSelected(
                      addressDetail: "${data.data?.specificAddressDetail != null ? "${data.data?.specificAddressDetail}, " : ''}"
                          "${data.data?.specificConstructionCommune}, "
                          "${data.data?.specificConstructionDistrict}, "
                          "${data.data?.specificConstructionProvince}",
                      provinceId: data.data?.provinceId,
                      idAreaWard: data.data?.areaId,
                      provinceName: data.data?.specificConstructionProvince,
                      districtName: data.data?.specificConstructionDistrict,
                      areaWardName: data.data?.specificConstructionCommune,
                      address: data.data?.specificAddressDetail,
                    )
                  : null,
              error: null,
            );
          }
        },
        error: (p0) => state = state.copyWith(
          isLoading: false,
          detail: null,
          error: p0.message,
        ),
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        detail: null,
        error: error.toString(),
      );
    }
  }

  // lấy thông tin
  // Future<void> getDataBranch() async {
  //   try {
  //     final result = await Dependencies().getIt<IOCContactRequestRepository>().getDataBranch();
  //     result.when(
  //       success: (data) {
  //         if ((data.data?.isNotEmpty ?? false) && data.status == IOCContactRequestConstant.apiStatusSuccess) {
  //           state = state.copyWith(
  //             listBranch: data.data ?? [],
  //           );
  //         } else {
  //           state = state.copyWith(
  //             listBranch: [],
  //           );
  //         }
  //       },
  //       error: (p0) => state = state.copyWith(
  //         listBranch: [],
  //         error: p0.message,
  //       ),
  //     );
  //   } catch (error) {
  //     state = state.copyWith(
  //       listBranch: [],
  //       error: error.toString(),
  //     );
  //   }
  // }

  // Future<void> getAllByParType() async {
  //   try {
  //     final result = await Dependencies().getIt<IOCContactRequestRepository>().getAllByParType(
  //       request: {
  //         'parType': 'NHOM_DOI_TAC',
  //       },
  //     );
  //     result.when(
  //       success: (data) {
  //         if ((data.data?.isNotEmpty ?? false) && data.status == IOCContactRequestConstant.apiStatusSuccess) {
  //           state = state.copyWith(
  //             partnerGroup: data.data ?? [],
  //
  //           );
  //         } else {
  //           state = state.copyWith(
  //             partnerGroup: [],
  //
  //           );
  //         }
  //       },
  //       error: (p0) => state = state.copyWith(
  //         partnerGroup: [],
  //         error: p0.message,
  //       ),
  //     );
  //   } catch (error) {
  //     state = state.copyWith(
  //       partnerGroup: [],
  //       error: error.toString(),
  //
  //     );
  //   }
  // }

  Future<void> getAppParamByParType() async {
    try {
      final result = await Dependencies().getIt<IOCContactRequestRepository>().getAppParamByParType(
        request: {
          'listParType': ["MODEL_BUILDER", "MODEL_BUILDER_B2B", "ITEM_TYPE", "RECEPTION_CHANNEL", "CUSTOMER_RESOURCES", "SOURCE_YCTX", "JOB", "INTERESTED_SERVICE", "CT_DON_GIA"],
          "name": null,
          "description": null,
          "order": 'ASC',
          "fieldOrder": 'name',
        },
      );
      result.when(
        success: (data) {
          if ((data.data?.isNotEmpty ?? false) && data.status == IOCContactRequestConstant.apiStatusSuccess) {
            // state = state.copyWith(
            //   listSpecificConstruction: [],
            //   listSpecificConstructionB2B: [],
            //   listModelOfTheBuilder: [],
            //   listReceptionChannel: [],
            //   listSourceYCTK: [],
            //   listCustomerResources: [],
            //   jobLst: [],
            //   listPerformanceType: [],
            //   listUnitPriceDetail: [],
            // );

            var listSpecificConstruction = <AppParam>[];
            var listSpecificConstructionB2B = <AppParam>[];
            var listModelOfTheBuilder = <AppParam>[];
            var listReceptionChannel = <AppParam>[];
            var listSourceYCTK = <AppParam>[];
            var listCustomerResources = <AppParam>[];
            var jobLst = <AppParam>[];
            var listPerformanceType = <AppParam>[];
            var listUnitPriceDetail = <AppParam>[];

            data.data?.forEach((element) {
              switch (element.parType) {
                case "MODEL_BUILDER":
                  listSpecificConstruction.add(element);
                  break;
                case "MODEL_BUILDER_B2B":
                  listSpecificConstructionB2B.add(element);
                  break;
                case "ITEM_TYPE":
                  listModelOfTheBuilder.add(element);
                  break;
                case "RECEPTION_CHANNEL":
                  listReceptionChannel.add(element);
                  break;
                case "CUSTOMER_RESOURCES":
                  // element.isChecked = false;
                  listCustomerResources.add(element);
                  break;
                case "SOURCE_YCTX":
                  listSourceYCTK.add(element);
                  // listSourceXHH.assignAll(listSourceYCTK.where((e) => (e.code == "2")).toList());
                  break;
                case "JOB":
                  jobLst.add(element);
                  break;
                case 'INTERESTED_SERVICE':
                  listPerformanceType.add(element);
                  break;
                case 'CT_DON_GIA':
                  listUnitPriceDetail.add(element);
                  break;
              }
            });
            state = state.copyWith(
              listSpecificConstruction: listSpecificConstruction,
              listSpecificConstructionB2B: listSpecificConstructionB2B,
              listModelOfTheBuilder: listModelOfTheBuilder,
              listReceptionChannel: listReceptionChannel,
              listSourceYCTK: listSourceYCTK,
              listCustomerResources: listCustomerResources,
              jobLst: jobLst,
              listPerformanceType: listPerformanceType,
              listUnitPriceDetail: listUnitPriceDetail,
            );
          } else {
            state = state.copyWith(
              listSpecificConstruction: [],
              listSpecificConstructionB2B: [],
              listModelOfTheBuilder: [],
              listReceptionChannel: [],
              listSourceYCTK: [],
              listCustomerResources: [],
              jobLst: [],
              listPerformanceType: [],
              listUnitPriceDetail: [],
            );
          }
        },
        error: (p0) => state = state.copyWith(
          isLoading: false,
          detail: null,
          error: p0.message,
        ),
      );
    } catch (error) {
      state = state.copyWith(
        isLoading: false,
        detail: null,
        error: error.toString(),
      );
    }
  }
}
