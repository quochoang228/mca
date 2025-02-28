part of '../../../ioc_contact_request.dart';

class IocContactRequestRouter {
  init() {
    Dependencies().registerLazySingleton<IocContactRequestRouter>(
      () => IocContactRequestRouter(),
    );

    Dependencies().getIt<RouterService>().registerRoute(
          RouteEntry(
            path: IOCContactRequestService.iocContactRequest,
            protected: true,
            builder: (context, state) => const IocContactRequestPage(),
          ),
        );

    Dependencies().getIt<RouterService>().registerRoute(
          RouteEntry(
            path: IOCContactRequestService.iocContactRequestDetail,
            protected: true,
            builder: (context, state) => IocContactRequestDetailPage(
              contactRequest: state.extra as IocContactRequestB2B,
            ),
          ),
        );
  }
}
