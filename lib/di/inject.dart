// import 'package:ag/ag.dart';
import 'package:ag/ag.dart';
import 'package:auth/auth.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:di/di.dart';
import 'package:ioc_contact_request/ioc_contact_request.dart';

void injectorApp() {
  Dependencies().registerFactory(
    () => Dio(BaseOptions(baseUrl: 'https://as.tecklens.com/auto-sms')),
  );

  Dependencies().registerLazySingleton<ApiGateway>(
    () => ApiGateway(
      dio: Dependencies().getIt<Dio>(),
      getAccessToken: () async => '',
      connectivity: Connectivity(),
      onTrack: (event, data) {
        print("📊 Tracking Event: $event - $data");
      },
      // cacheDuration: null,
      // refreshAccessToken: () async => '',
      // maxRequests: null,
      // rateLimitDuration: null,
      // failureThreshold: null,
      // circuitResetTimeout: null,
    ),
  );

  // appLocator.registerLazySingleton<BaseClient>(
  //   () => BaseClient(
  //     dio: appLocator<Dio>(),
  //   ),
  // );

  AuthDependency().init();
  IOCContactRequestDependency().init();
  // SmsDependency().init();
  // AccountDependency().init();
  // LogDependency().init();
}
