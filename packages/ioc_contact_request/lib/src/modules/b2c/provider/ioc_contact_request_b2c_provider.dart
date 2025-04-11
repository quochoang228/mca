part of '../../../../ioc_contact_request.dart';

final iocContactRequestB2CProvider = StateNotifierProvider.autoDispose<IocContactRequestB2CProvider, DataState<List<IocContactRequest>, ErrorResponse>>(
  (ref) => IocContactRequestB2CProvider(ref),
);

class IocContactRequestB2CProvider extends StateNotifier<DataState<List<IocContactRequest>, ErrorResponse>> {
  IocContactRequestB2CProvider(this.ref) : super(NotLoaded<List<IocContactRequest>>());

  final Ref ref;

  List<IocContactRequest> dataBackup = [];

  Future<void> getListContactB2C(int? pageKey) async {
    if (state.state == CurrentDataState.loading) return;

    state = Loading<List<IocContactRequest>>();
    try {
      final authService = Dependencies().getIt<AuthService>();
      final user = authService.getUser();

      final result = await Dependencies().getIt<IOCContactRequestRepository>().getListContactB2C(
        request: {
          'page': 1,
          'pageSize': 20,
          "userNameAio": "user_chct_1",
          // "userNameAio": Dependencies().getIt<AuthService>().getUser(),
          "keySearch": "",
          "state": null,
          "lstState": null,
          "createDateFrom": null,
          "createDateTo": null,
          "dateFrom": null,
          "dateTo": null,
          "status": null,
          "provinceId": null,
          "createdUser": null,
          "performerId": null,
          "statusComplete": null,
          "lstBranch": null,
          "lstKpiStatus": null,
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
}
