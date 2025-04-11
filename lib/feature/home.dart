import 'package:ag/ag.dart';
import 'package:auth/auth.dart';
import 'package:di/di.dart';
import 'package:ds/ds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ioc_contact_request/ioc_contact_request.dart';
import '../router/paths.dart';


class Home extends StatefulHookConsumerWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  Future<User?> getUser() {
    final authService = Dependencies().getIt<AuthService>();
    final user = authService.getUser();
    return user;
  }

  @override
  Widget build(BuildContext context) {
    var user = useState<User?>(User());

    useMemoized(
      () async {
        user.value = await getUser();
        // var data = await Dependencies().getIt<AuthService>().getUser();
        // user.value = data ?? User();
      },
    );

    return Scaffold(
      backgroundColor: DSColors.backgroundWhite,
      appBar: AppBar(
        title: Text(
          'Super App Nội Bộ',
          style: DSTextStyle.headlineLarge.semiBold(),
        ),
        backgroundColor: DSColors.backgroundWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user.value?.email ?? 'Chưa đăng nhập',
            ),
            Text(
              'Home Page - Super App Nội Bộ',
              style: DSTextStyle.headlineLarge,
            ),
            Text(
              'Home Page - Super App Nội Bộ',
              style: DSTextStyleFS.fsHeadlineLarge,
            ),
            const Gap(DSSpacing.spacing4),
            DSButton(
              label: 'Go Login',
              onPressed: () async {
                final authService = Dependencies().getIt<AuthService>();
                final isLoggedIn = await authService.isLoggedIn(); // Kiểm tra trạng thái đăng nhập
                if (!isLoggedIn) {
                  await context.push(
                      // authService.loginRouter
                      AuthService.loginRouter);
                  user.value = await getUser();
                } else {
                  // DSNormalToast.showSuccess(
                  //   context: context,
                  //   text: 'Đã đăng nhập',
                  // );
                }
              },
            ),
            const Gap(DSSpacing.spacing4),
            DSButton(
              label: 'about',
              onPressed: () {
                context.push(Paths.about);
              },
            ),
            const Gap(DSSpacing.spacing4),
            DSButton(
              label: 'Yêu cầu tiếp xúc',
              onPressed: () {
                context.push(IOCContactRequestService.iocContactRequestType);
              },
            ),
            const Gap(DSSpacing.spacing4),
            DSButton(
              label: 'Setting',
              onPressed: () {
                context.push(Paths.settings);
              },
            ),
            const Gap(DSSpacing.spacing4),
            DSButton(
              label: 'Log Out',
              onPressed: () async {
                await Dependencies().getIt<ApiGateway>().setToken('');
                var data = await Dependencies().getIt<AuthService>().logout();
                if (data) {
                  // DSNormalToast.showSuccess(
                  //   context: context,
                  //   text: 'Log out thành công',
                  // );
                  user.value = await getUser();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
