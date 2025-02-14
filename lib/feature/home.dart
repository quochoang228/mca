import 'package:auth/auth.dart';
import 'package:base_ui/base_ui.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../router/paths.dart';

class Home extends StatefulHookConsumerWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.backgroundWhite,
      appBar: AppBar(
        title: Text(
          'Super App Nội Bộ',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: BaseColors.backgroundWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(BaseSpacing.spacing4),
            BaseSolidButton(
              label: 'Go Login',
              onPressed: () async {
                final authService = Dependencies().getIt<AuthService>();
                final isLoggedIn = await authService
                    .isLoggedIn(); // Kiểm tra trạng thái đăng nhập
                if (!isLoggedIn) {
                  context.push(Paths.login);
                } else {
                  BaseNormalToast.showSuccess(
                    context: context,
                    text: 'Đã đăng nhập',
                  );
                }
              },
            ),
            const Gap(BaseSpacing.spacing4),
            BaseSolidButton(
              label: 'about',
              onPressed: () {
                context.push(Paths.about);
              },
            ),
            const Gap(BaseSpacing.spacing4),
            BaseSolidButton(
              label: 'Yêu cầu tiếp xúc',
              onPressed: () {
                context.push(Paths.iocContactRequest);
              },
            ),
            const Gap(BaseSpacing.spacing4),
            BaseSolidButton(
              label: 'Setting',
              onPressed: () {
                context.push(Paths.settings);
              },
            ),
            const Gap(BaseSpacing.spacing4),
            BaseSolidButton(
              label: 'Log Out',
              onPressed: () async {
                var data = await Dependencies().getIt<AuthService>().logout();
                if (data) {
                  BaseNormalToast.showSuccess(
                    context: context,
                    text: 'Log out thành công',
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
