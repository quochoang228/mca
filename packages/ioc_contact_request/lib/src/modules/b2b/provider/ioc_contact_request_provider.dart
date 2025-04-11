part of '../../../../ioc_contact_request.dart';

final iocContactRequestProvider = StateNotifierProvider.autoDispose<IocContactRequestProvider, DataState<List<IocContactRequest>, ErrorResponse>>(
  (ref) => IocContactRequestProvider(ref),
);

class IocContactRequestProvider extends StateNotifier<DataState<List<IocContactRequest>, ErrorResponse>> {
  IocContactRequestProvider(this.ref) : super(NotLoaded<List<IocContactRequest>>());

  final Ref ref;

  List<IocContactRequest> dataBackup = [];

  Future<void> getListContactB2B(int? pageKey) async {
    if (state.state == CurrentDataState.loading) return;

    state = Loading<List<IocContactRequest>>();
    try {
      final result = await Dependencies().getIt<IOCContactRequestRepository>().getListContactB2B(
        request: {
          'page': 4,
          'pageSize': 10,
          'userNameAio': "240476",
          // 'userNameAio' : Dependencies().getIt<AuthService>().user?.email,
        },
      );
      result.when(
        success: (data) {
          if (data.data?.isNotEmpty ?? false) {
            state = Fetched(data.data!);
            dataBackup = data.data!;
          } else {
            state = NoData();
          }
        },
        error: (p0) => state = Failed(ErrorResponse(message: p0.message ?? '')),
        // error: (error) => state = Failed(error),
      );
    } catch (error) {
      state = Failed(ErrorResponse(message: error.toString()));
    }
  }

// void filter(WoStationStatusEnum woStationStatusEnum) {
//   if (dataBackup.isEmpty) return;
//   final filteredData = woStationStatusEnum == WoStationStatusEnum.all
//       ? dataBackup
//       : dataBackup.where((element) => element.status == woStationStatusEnum.status).toList();
//
//   state = filteredData.isEmpty ? NoData() : Fetched(filteredData);
// }
}
