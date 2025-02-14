part of '../../../auth.dart';

class AuthService {
  final AuthRepository _authRepository;

  AuthService(this._authRepository);

  Future<bool> isLoggedIn() => _authRepository.isLoggedIn();

  String?
      lastAttemptedRoute; // Trang cuối cùng trước khi bị redirect

  String?
      loginSuccessAttemptedRoute; // Lưu lại trang cần truy cập khi login thành công
  Future<void> login(String url, Map<String, dynamic> request) =>
      _authRepository.login(url: url, request: request);

  void onLoginSuccess(BuildContext context) {
    // final redirectTo =
    //     lastAttemptedRoute ?? '/'; // Nếu không có thì về trang chủ
    // lastAttemptedRoute = null; // Reset để tránh redirect lại lần sau

    // GoRouter.of(context).pushReplacement(redirectTo);

    if (loginSuccessAttemptedRoute == null) {
      loginSuccessAttemptedRoute = null;
      // Nếu không có lastAttemptedRoute → Login trực tiếp → Pop về trang trước
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      } else {
        context.pushReplacement(
            '/'); // Nếu không pop được → Điều hướng về init router
      }
    } else {
      final redirectTo = loginSuccessAttemptedRoute!;
      loginSuccessAttemptedRoute = null;
      GoRouter.of(context).pushReplacement(redirectTo);
    }
  }

  // void onLoginSuccess(BuildContext context) {
  //   if (lastAttemptedRoute == null) {
  //     // Nếu không có lastAttemptedRoute → Login trực tiếp → Pop về trang trước
  //     if (Navigator.of(context).canPop()) {
  //       Navigator.of(context).pop();
  //     } else {
  //       context.pushReplacement('/');
  //     }
  //   } else {
  //     // Nếu có lastAttemptedRoute → Login từ trang cần đăng nhập → Điều hướng đến đó
  //     final redirectTo = lastAttemptedRoute!;
  //     lastAttemptedRoute = null; // Reset sau khi điều hướng
  //     context.pushReplacement(redirectTo);
  //   }
  // }

  Future<String?> fetchToken() => _authRepository.fetchToken();

  Future<bool> logout() => _authRepository.logOut();
}
