import 'package:ag/ag.dart';
import 'package:auth/auth.dart';
import 'package:cdn/cdn.dart';
import 'package:di/di.dart';
import 'package:ds/ds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ioc_contact_request/ioc_contact_request.dart';
import 'package:mca/router/paths.dart';
import '../widgets/menu_item.dart';

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
      // appBar: AppBar(
      //   title: Text(
      //     'Super App Nội Bộ',
      //     style: DSTextStyle.headlineLarge.semiBold(),
      //   ),
      //   backgroundColor: DSColors.backgroundWhite,
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(DSSpacing.spacing4),
                bottomRight: Radius.circular(DSSpacing.spacing4),
              ),
              image: DecorationImage(
                image: CDNAssets.images.header.provider(),
                fit: BoxFit.cover,
              ),
            ),
            height: MediaQuery.sizeOf(context).height * 0.3,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: DSSpacing.spacing4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Xin chào',
                            style: DSTextStyle.titleSmall
                                .applyColor(DSColors.textOnColor),
                          ),
                          Text(
                            user.value?.email ?? 'Chưa đăng nhập',
                            style: DSTextStyle.bodySmall
                                .applyColor(DSColors.textOnColor),
                            // style: DSTextStyleFS.fsHeadlineLarge,
                          ),
                        ],
                      ),
                    ),
                    user.value?.email != null
                        ? InkWell(
                            onTap: () async {
                              await Dependencies()
                                  .getIt<ApiGateway>()
                                  .setToken('');
                              var data = await Dependencies()
                                  .getIt<AuthService>()
                                  .logout();
                              if (data) {
                                // DSNormalToast.showSuccess(
                                //   context: context,
                                //   text: 'Log out thành công',
                                // );
                                user.value = await getUser();
                              }
                            },
                            child: Icon(
                              Icons.logout,
                              color: DSCoreColors.white,
                            ),
                          )
                        : DSButton(
                            label: 'Đăng nhập ngay',
                            backgroundColor: DSCoreColors.transparent,
                            onPressed: () async {
                              final authService =
                                  Dependencies().getIt<AuthService>();
                              final isLoggedIn = await authService
                                  .isLoggedIn(); // Kiểm tra trạng thái đăng nhập
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
                  ],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(DSSpacing.spacing4),
                child: Text(
                  'Tính năng',
                  style: DSTextStyle.headlineMedium.semiBold(),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                childAspectRatio: 1.2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                padding: EdgeInsets.zero,
                children: [
                  MenuItem(
                    title: 'AIO Partner',
                    image: CDNAssets.icons.menu1.svg(),
                    onTap: () {
                      context.push(Paths.b2C);
                    },
                  ),
                  MenuItem(
                    title: 'Yêu cầu tiếp xúc',
                    image: CDNAssets.icons.menu2.svg(),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            color: DSColors.backgroundWhite,
                            padding: const EdgeInsets.all(DSSpacing.spacing4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Yêu cầu tiếp xúc',
                                  style: DSTextStyle.headlineMedium.semiBold(),
                                  textAlign: TextAlign.center,
                                ),
                                InkWell(
                                  onTap: () {
                                    context.pop();
                                    context.push(IOCContactRequestService
                                        .iocContactRequestB2C);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                        DSSpacing.spacing4),
                                    child: Row(
                                      children: [
                                        CDNAssets.icons.connection.svg(
                                          colorFilter: ColorFilter.mode(
                                            DSColors.textBody,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        const Gap(DSSpacing.spacing4),
                                        Text(
                                          'Yêu cầu tiếp xúc B2C',
                                          style: DSTextStyle.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    context.pop();
                                    context.push(IOCContactRequestService
                                        .iocContactRequest);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                        DSSpacing.spacing4),
                                    child: Row(
                                      children: [
                                        CDNAssets.icons.connection.svg(
                                          colorFilter: ColorFilter.mode(
                                            DSColors.textBody,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                        const Gap(DSSpacing.spacing4),
                                        Text(
                                          'Yêu cầu tiếp xúc B2B',
                                          style: DSTextStyle.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  // MenuItem(
                  //   title: 'Đăng xuất',
                  //   image: CDNAssets.icons.briefcase1.svg(),
                  //   onTap: () async {
                  //     await Dependencies().getIt<ApiGateway>().setToken('');
                  //     var data =
                  //         await Dependencies().getIt<AuthService>().logout();
                  //     if (data) {
                  //       // DSNormalToast.showSuccess(
                  //       //   context: context,
                  //       //   text: 'Log out thành công',
                  //       // );
                  //       user.value = await getUser();
                  //     }
                  //   },
                  // ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       padding: const EdgeInsets.all(DSSpacing.spacing15s),
                  //       decoration: BoxDecoration(
                  //         color: DSColors.backgroundWhite,
                  //         borderRadius: BorderRadius.circular(DSSpacing.spacing3),

                  //       ),
                  //       child: CDNAssets.icons.connection.svg(),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              // DSButton(
              //   label: 'Go Login',
              //   onPressed: () async {
              //     final authService = Dependencies().getIt<AuthService>();
              //     final isLoggedIn = await authService.isLoggedIn(); // Kiểm tra trạng thái đăng nhập
              //     if (!isLoggedIn) {
              //       await context.push(
              //           // authService.loginRouter
              //           AuthService.loginRouter);
              //       user.value = await getUser();
              //     } else {
              //       // DSNormalToast.showSuccess(
              //       //   context: context,
              //       //   text: 'Đã đăng nhập',
              //       // );
              //     }
              //   },
              // ),
              // const Gap(DSSpacing.spacing4),
              // DSButton(
              //   label: 'about',
              //   onPressed: () {
              //     context.push(Paths.about);
              //   },
              // ),
              // const Gap(DSSpacing.spacing4),
              // DSButton(
              //   label: 'Yêu cầu tiếp xúc',
              //   onPressed: () {
              //     context.push(IOCContactRequestService.iocContactRequestType);
              //   },
              // ),
              // const Gap(DSSpacing.spacing4),
              // DSButton(
              //   label: 'Setting',
              //   onPressed: () {
              //     context.push(Paths.settings);
              //   },
              // ),
              // const Gap(DSSpacing.spacing4),
              // DSButton(
              //   label: 'Log Out',
              //   onPressed: () async {
              //     await Dependencies().getIt<ApiGateway>().setToken('');
              //     var data = await Dependencies().getIt<AuthService>().logout();
              //     if (data) {
              //       // DSNormalToast.showSuccess(
              //       //   context: context,
              //       //   text: 'Log out thành công',
              //       // );
              //       user.value = await getUser();
              //     }
              //   },
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
