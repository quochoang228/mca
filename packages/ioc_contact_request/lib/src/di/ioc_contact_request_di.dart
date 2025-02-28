part of '../../../ioc_contact_request.dart';

class IOCContactRequestDependency implements BaseDependencies {
  @override
  void apiDependency() {
    final dependencies = Dependencies();

    dependencies.registerFactory<IOCContactRequestApi>(
      () => IOCContactRequestApiImpl(apiGateway: dependencies.getIt()),
    );

    dependencies.registerFactory<IOCContactRequestLocalStorage>(
      () => IOCContactRequestLocalStorageImpl(storage: dependencies.getIt()),
    );
  }

  @override
  void repositoryDependency() {
    final dependencies = Dependencies();

    dependencies.registerLazySingleton<IOCContactRequestRepository>(
      () => IOCContactRequestRepositoryImpl(
        api: dependencies.getIt(),
        localStorage: dependencies.getIt(),
      ),
    );
  }

  @override
  void init() {
    apiDependency();
    repositoryDependency();

    Dependencies().registerLazySingleton<IOCContactRequestService>(
      () => IOCContactRequestService(Dependencies().getIt()),
    );

    IocContactRequestRouter().init();

    // Dependencies().registerLazySingleton<IocContactRequestRouter>(
    //   () => IocContactRequestRouter(),
    // );
    //
    // Dependencies().getIt<RouterService>().registerRoute(
    //   RouteEntry(
    //     path: IOCContactRequestService.iocContactRequest,
    //     protected: true,
    //     builder: (context) => const IocContactRequestPage(),
    //   ),
    // );
  }
}
