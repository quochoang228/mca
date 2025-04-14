part of '../../../ioc_contact_request.dart';

class IocContactRequestRouter {
  init() {
    Dependencies().registerLazySingleton<IocContactRequestRouter>(
      () => IocContactRequestRouter(),
    );

    Dependencies().getIt<RouterService>().registerRoute(
          RouteEntry(
            path: IOCContactRequestService.iocContactRequestType,
            protected: true,
            builder: (context, state) => const IocContactRequestType(),
          ),
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
            path: IOCContactRequestService.iocContactRequestB2C,
            protected: true,
            builder: (context, state) => IocContactRequestB2CPage(),
          ),
        );

    Dependencies().getIt<RouterService>().registerRoute(
          RouteEntry(
            path: IOCContactRequestService.iocContactRequestDetail,
            protected: true,
            builder: (context, state) => IocContactRequestDetailPage(
              contactRequest: state.extra as IocContactRequest,
            ),
          ),
        );

    Dependencies().getIt<RouterService>().registerRoute(
          RouteEntry(
            path: IOCContactRequestService.iocContactRequestB2CDetail,
            protected: true,
            builder: (context, state) => IocContactRequestB2CDetailPage(
              contactRequest: state.extra as IocContactRequest,
            ),
          ),
        );

    Dependencies().getIt<RouterService>().registerRoute(
          RouteEntry(
            path: IOCContactRequestService.iocContactRequestHouseModel,
            protected: true,
            builder: (context, state) => HouseModelPage(
              tangentCustomerId: state.extra as int,
            ),
          ),
        );
  }
}
