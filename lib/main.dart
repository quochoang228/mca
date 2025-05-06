import 'package:ag/ag.dart';
import 'package:auth/auth.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:persistent_storage/persistent_storage.dart';
import 'package:router/router.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:vcc/dependencies/application_dependency.dart';

import 'di/inject.dart';

// void main() {
//   injectorApp();
//   runApp(const MainApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.builder,
    this.themeData,
    this.routerConfig,
    // required this.supportedLocales,
    // this.localizationsDelegates,
  });

  final TransitionBuilder builder;
  final ThemeData? themeData;
  final RouterConfig<Object>? routerConfig;

  // final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  // final Iterable<Locale> supportedLocales;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: themeData,
      builder: builder,
      debugShowCheckedModeBanner: false,
      routerConfig: routerConfig,
      // localizationsDelegates: localizationsDelegates,
      // supportedLocales: supportedLocales,
    );
  }
}

Future<void> main() async {
  injectorRouterApp();

  ApplicationDependency().init();

  bootstrapMCA(
    app: ListenableBuilder(
      listenable: Dependencies().getIt<RouterService>(),
      builder: (context, child) {
        return  ProviderScope(
          child: MyApp(
            builder: (context, child) {
              return child!;
            },
            // supportedLocales: AppLocalizations.supportedLocales,
            // localizationsDelegates: AppLocalizations.localizationsDelegates,
            routerConfig: Dependencies().getIt<RouterService>().router,
            // routerConfig: AppRouter.configuration,
            themeData: ThemeData(
              // appBarTheme: AppBarTheme(
              //   backgroundColor: CoreColors.transparent,
              //   scrolledUnderElevation: 0.0,
              //   systemOverlayStyle: SystemUiOverlayStyle.light,
              // ),
              // brightness: Brightness.light,
              // useMaterial3: true,
            ),
          ),
        );
      },
    ),
    // app: ProviderScope(
    //   child: MyApp(
    //     builder: (context, child) {
    //       return child!;
    //     },
    //     // supportedLocales: AppLocalizations.supportedLocales,
    //     // localizationsDelegates: AppLocalizations.localizationsDelegates,
    //     routerConfig: Dependencies().getIt<RouterService>().router,
    //     // routerConfig: AppRouter.configuration,
    //     themeData: ThemeData(
    //         // appBarTheme: AppBarTheme(
    //         //   backgroundColor: CoreColors.transparent,
    //         //   scrolledUnderElevation: 0.0,
    //         //   systemOverlayStyle: SystemUiOverlayStyle.light,
    //         // ),
    //         // brightness: Brightness.light,
    //         // useMaterial3: true,
    //         ),
    //   ),
    // ),
  );
}

Future<void> bootstrapMCA({
  required Widget app,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  // set orientations
  preferredOrientations();

  // set style UI system
  setSystemUI();

  // Dependencies local storage
  await initPersistentStorage();

  // Dependencies
  injectorApp();

  var token = await Dependencies().getIt<AuthService>().fetchToken();

  await Dependencies().getIt<ApiGateway>().setToken(token ?? '');

  runApp(
    ProviderScope(
      child: app,
    ),
  );
}

Future<void> initPersistentStorage() async {
  // Dependencies local storage
  await PersistentDependencies.dependeincies();
}

Future<void> preferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void setSystemUI() {
  // set style UI system
  //statusBarColor: Status bar background color
// statusBarIconBrightness: Status bar icon color (dark/light)
// systemNavigationBarColor: Bottom navigation bar color
// systemNavigationBarIconBrightness: Navigation bar icon color
// systemNavigationBarDividerColor: Navigation bar divider color

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
}
