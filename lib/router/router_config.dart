import 'package:auth/auth.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ioc_contact_request/ioc_contact_request.dart';
import '../feature/about.dart';
import '../feature/home.dart';
import '../feature/settings.dart';
import '../feature/splash.dart';
import 'paths.dart';

class AppCoordinator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context {
    final currentState = navigatorKey.currentState;
    if (currentState == null) {
      throw FlutterError(
          'NavigatorState is null. Ensure that navigation is initialized.');
    }
    return currentState.context;
  }
}

class AppRouter {
  static final GoRouter configuration = GoRouter(
    initialLocation: Paths.splash,
    debugLogDiagnostics: false,
    redirect: AppRouterGuard.guard3,
    navigatorKey: AppCoordinator.navigatorKey,
    routes: [
      _goRoute(Paths.splash, const SplashPage()),
      _goRoute(Paths.home, const Home()),
      _goRoute(Paths.login, LoginPage()),
      _goRoute(Paths.about, const AboutPage()),
      _goRoute(Paths.settings, const SettingsPage()),
      _goRoute(Paths.iocContactRequest, const IocContactRequestPage()),
    ],
  );

  /// Danh sách các trang yêu cầu đăng nhập
  static const Set<String> protectedRoutes = {
    Paths.settings,
    Paths.iocContactRequest,
  };

  static GoRoute _goRoute(String path, Widget page) {
    return GoRoute(
      path: path,
      builder: (context, state) => page,
    );
  }
}

class AppRouterGuard {
  static Future<String?> guard2(
    BuildContext context,
    GoRouterState state,
  ) async {
    final authService = Dependencies().getIt<AuthService>();
    final isLoggedIn =
        await authService.isLoggedIn(); // Kiểm tra trạng thái đăng nhập

    // final String location = state.matchedLocation;
    final String location =
        state.matchedLocation.split('?').first; // Bỏ query params

    // Nếu chưa đăng nhập và đang vào trang yêu cầu đăng nhập → Lưu lại đường dẫn & redirect đến login
    if (!isLoggedIn && AppRouter.protectedRoutes.contains(location)) {
      authService.lastAttemptedRoute = location;
      return Paths.login;
    }

    // Nếu đã đăng nhập nhưng cố tình truy cập `/login`, hiển thị thông báo và
    // không redirect
    // Lỗi: không hoạt động do return null hoặc state.uri.toString() vẫn trả về path /login
    // if (isLoggedIn && location == Paths.login) {
    //   Future.delayed(Duration.zero, () {
    //     ScaffoldMessenger.of(AppCoordinator.navigatorKey.currentContext!)
    //         .showSnackBar(
    //       SnackBar(
    //         content: Text("Bạn đã đăng nhập rồi!"),
    //         duration: Duration(seconds: 2),
    //       ),
    //     );
    //   });

    //   return null; // Không redirect, giữ nguyên trang login
    // }

    // Nếu đã đăng nhập mà vào trang login → Chuyển đến trang đích hoặc Home
    if (isLoggedIn && location == Paths.login) {
      final redirectTo = authService.lastAttemptedRoute?.isNotEmpty == true
          ? authService.lastAttemptedRoute
          : Paths.home;

      authService.lastAttemptedRoute = null; // Reset sau khi điều hướng
      return redirectTo;
    }

    return null; // Không cần chuyển hướng
  }

  static Future<String?> guard3(
    BuildContext context,
    GoRouterState state,
  ) async {
    final authService = Dependencies().getIt<AuthService>();
    final isLoggedIn =
        await authService.isLoggedIn(); // Kiểm tra trạng thái đăng nhập
    final String location = state.matchedLocation
        .split('?')
        .first; // location hiện tại : Bỏ query params

    final String lastAttemptedRoute =
        authService.lastAttemptedRoute ?? ''; // location cuối cùng
    authService.lastAttemptedRoute = location;

    if (!AppRouter.protectedRoutes.contains(location)) {
      if (!AppRouter.protectedRoutes.contains(lastAttemptedRoute)) {
        authService.loginSuccessAttemptedRoute = null;
      }
      return null;
    } else {
      if (isLoggedIn) {
        return null;
      } else {
        authService.loginSuccessAttemptedRoute = location;
        return Paths.login;
      }
    }
  }
}

class FadeTransitionPage extends CustomTransitionPage<void> {
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curveTween = CurveTween(curve: Curves.easeIn);
            return FadeTransition(
              opacity: animation.drive(curveTween),
              child: child,
            );
          },
        );
}
