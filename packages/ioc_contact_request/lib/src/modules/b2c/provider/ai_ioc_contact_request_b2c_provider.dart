part of '../../../../ioc_contact_request.dart';

final aiIocContactRequestB2CProvider = StateNotifierProvider<
    AIIocContactRequestB2CProvider, AIIocContactRequestB2CState>(
  (ref) => AIIocContactRequestB2CProvider(),
);

class AIIocContactRequestB2CProvider
    extends StateNotifier<AIIocContactRequestB2CState> {
  AIIocContactRequestB2CProvider()
      : super(
          AIIocContactRequestB2CState(),
        );

  Future<void> getAppParamByParType() async {
    try {
      final result = await Dependencies()
          .getIt<IOCContactRequestRepository>()
          .getAppParamByParType(
        request: {
          'listParType': [
            'ROOF_TYPE',
            'STYLISH_DESIGN',
          ],
        },
      );
      result.when(
        success: (data) {
          if ((data.data?.isNotEmpty ?? false) &&
              data.status == IOCContactRequestConstant.apiStatusSuccess) {
            var listRoofType = <AppParam>[];
            var listStylishDesign = <AppParam>[];
            data.data?.forEach((element) {
              switch (element.parType) {
                case "ROOF_TYPE":
                  listRoofType.add(element);
                  break;
                case "STYLISH_DESIGN":
                  listStylishDesign.add(element);
                  break;
              }
            });

            state = state.copyWith(
              listRoofType: listRoofType,
              listStylishDesign: listStylishDesign,
            );
          } else {
            state = state.copyWith(
              listRoofType: [],
              listStylishDesign: [],
            );
          }
        },
        error: (p0) => state = state.copyWith(
          listRoofType: [],
          listStylishDesign: [],
          error: p0.message,
        ),
      );
    } catch (error) {
      state = state.copyWith(
        listRoofType: [],
        listStylishDesign: [],
        error: error.toString(),
      );
    }
  }
}
