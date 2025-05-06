// import 'package:ag/ag.dart';
import 'package:ag/ag.dart';
import 'package:auth/auth.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:di/di.dart';
import 'package:ioc_contact_request/ioc_contact_request.dart';
import 'package:mca/feature/home.dart';
import 'package:router/router.dart';
import 'package:vcc/app_configs/app.dart';

import '../feature/about.dart';
import '../feature/settings.dart';
import '../feature/splash.dart';
import '../router/paths.dart';

void injectorApp() {
  // https://apis.congtrinhviettel.com.vn/ioc-mobile

  Dependencies().registerFactory(
    () => Dio(BaseOptions(baseUrl: 'http://10.248.242.247:8720/ioc-service')),
  );

  Dependencies().registerLazySingleton<ApiGateway>(
    () => ApiGateway(
      dio: Dependencies().getIt<Dio>(),
      getAccessToken: () async => '',
      onTokenExpired: () {
        print("🔐 Token Expired");
      },
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

void injectorRouterApp() {
  /// dependencies router
  // RouterDependency.setUpDependencies();

  Dependencies().registerSingleton<RouterService>(RouterService(),
  );

  Dependencies().getIt<RouterService>().registerRoutes([
    RouteEntry(
      path: Paths.splash,
      builder: (context, state) => const SplashPage(),
    ),
    RouteEntry(
      path: Paths.home,
      builder: (context, state) => const Home(),
    ),
    RouteEntry(
      path: Paths.about,
      builder: (context, state) => const AboutPage(),
    ),
    RouteEntry(
      path: Paths.settings,
      builder: (context, state) => const SettingsPage(),
    ),


    RouteEntry(
      path: Paths.b2C,
      builder: (context, state) => const MyApp(),
    ),
    // RouteEntry(
    //   path: Paths.iocContactRequest,
    //   builder: (context) => const IocContactRequestPage(),
    // ),
  ]);
}
