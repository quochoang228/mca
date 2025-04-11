part of '../../../../ioc_contact_request.dart';

final iocContactRequestDetailProvider = StateNotifierProvider<IocContactRequestDetailProvider, IocContactRequestDetailState>(
  (ref) => IocContactRequestDetailProvider(),
);

// Tạo Notifier để quản lý state
class IocContactRequestDetailProvider extends StateNotifier<IocContactRequestDetailState> {
  IocContactRequestDetailProvider()
      : super(
          IocContactRequestDetailState(
            listBranch: [],
            partnerGroup: [],
            paramDataSources: [],
            detail: IocContactRequest(),
            isLoading: false,
          ),
        );

  // lấy thông tin
  Future<void> getDataBranch() async {
    try {
      final result = await Dependencies().getIt<IOCContactRequestRepository>().getDataBranch();
      result.when(
        success: (data) {
          if ((data.data?.isNotEmpty ?? false) && data.status == IOCContactRequestConstant.apiStatusSuccess) {
            state = state.copyWith(
              listBranch: data.data ?? [],
            );
          } else {
            state = state.copyWith(
              listBranch: [],
            );
          }
        },
        error: (p0) => state = state.copyWith(
          listBranch: [],
          error: p0.message,
        ),
      );
    } catch (error) {
      state = state.copyWith(
        listBranch: [],
        error: error.toString(),
      );
    }
  }

  Future<void> getAllByParType() async {
    try {
      final result = await Dependencies().getIt<IOCContactRequestRepository>().getAllByParType(
        request: {
          'parType': 'NHOM_DOI_TAC',
        },
      );
      result.when(
        success: (data) {
          if ((data.data?.isNotEmpty ?? false) && data.status == IOCContactRequestConstant.apiStatusSuccess) {
            state = state.copyWith(
              partnerGroup: data.data ?? [],

            );
          } else {
            state = state.copyWith(
              partnerGroup: [],

            );
          }
        },
        error: (p0) => state = state.copyWith(
          partnerGroup: [],
          error: p0.message,
        ),
      );
    } catch (error) {
      state = state.copyWith(
        partnerGroup: [],
        error: error.toString(),

      );
    }
  }

  Future<void> getAppParamByParType() async {
    try {
      final result = await Dependencies().getIt<IOCContactRequestRepository>().getAppParamByParType(
        request: {
          'listParType': [
            'DATA_RESOURCES',
          ],
          "name": null,
          "description": null,
          "order": 'ASC',
          "fieldOrder": 'name',
        },
      );
      result.when(
        success: (data) {
          if ((data.data?.isNotEmpty ?? false) && data.status == IOCContactRequestConstant.apiStatusSuccess) {
            state = state.copyWith(
              paramDataSources: data.data ?? [],
            );
          } else {
            state = state.copyWith(
              paramDataSources: [],
            );
          }
        },
        error: (p0) => state = state.copyWith(
          paramDataSources: [],
          error: p0.message,
        ),
      );
    } catch (error) {
      state = state.copyWith(
        paramDataSources: [],
        error: error.toString(),
      );
    }
  }

  Future<void> getContactDetailB2B(int? id) async {
    if (id == null) {
      state = state.copyWith(
        isLoading: false,
        detail: null,
        error: 'Kiểm tra lại dữ liệu của bạn: Không có id',
      );
    }
    state = state.copyWith(isLoading: true);
    try {
      final result = await Dependencies().getIt<IOCContactRequestRepository>().getContactDetailB2B(
        request: {
          'id': id,
          'isViewDetail': true,
        },
      );
      result.when(
        success: (data) {
          if ((data.data != null) && data.status == IOCContactRequestConstant.apiStatusSuccess) {
            state = state.copyWith(
              isLoading: false,
              detail: data.data,
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
}
