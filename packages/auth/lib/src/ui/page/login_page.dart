part of '../../../auth.dart';

typedef OnLoginSuccess = Function(User user);

class LoginPage extends StatefulHookConsumerWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  // late String endPoint;
  // late OnLoginSuccess onLoginSuccess;

  // @override
  // void initState() {
  //   super.initState();
  //   final data = GoRouterState.of(context).extra as Map<String, dynamic>?;
  //   endPoint = data?['endPoint'];
  //   onLoginSuccess = data?['onLoginSuccess'];
  // }

  @override
  Widget build(BuildContext context) {
    //     final data = GoRouterState.of(context).extra as Map<String, dynamic>?;
    // endPoint = data?['endPoint'];
    // onLoginSuccess = data?['onLoginSuccess'];

    var userController = useTextEditingController(
        text: kDebugMode ? AuthConstant.accountTestUsername : '');
    var passWorkController = useTextEditingController(
        text: kDebugMode ? AuthConstant.accountTestPassword : '');

    var isUserControllerNotEmpty = useListenableSelector(
      userController,
      () => userController.text.isNotEmpty,
    );
    var isPassWorkControllerNotEmpty = useListenableSelector(
      passWorkController,
      () => passWorkController.text.isNotEmpty,
    );

    var isObscureText = useState(true);

    ref.listen(loginProvider, (previous, next) {
      next.onState(
        notLoaded: () => const SizedBox(),
        loading: () => LoadingDialog.show(context),
        fetched: (value) {
          LoadingDialog.dismiss(context);
          BaseNormalToast.showError(
            context: context,
            text: 'Đăng nhập thành công!',
          );
          // context.pop();
          // onLoginSuccess(value);
          Dependencies().getIt<AuthService>().onLoginSuccess(context);
        },
        noData: () => const SizedBox(),
        failed: (err) {
          LoadingDialog.dismiss(context);
          BaseNormalToast.showError(
            context: context,
            text: (err as ErrorResponse).message ?? '',
          );
        },
      );
    });

    return Scaffold(
      backgroundColor: BaseColors.backgroundWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(BaseSpacing.spacing6),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hero(
                //   tag: 'logo',
                //   child: MyAssets.images.logo.image(
                //       width: context.mqSize.width * 0.3,
                //       height: context.mqSize.width * 0.3),
                // ),
                Text('Supper App'),
                const Gap(BaseSpacing.spacing4),
                Text(
                  'context.l10n.buttonLogin',
                  style: BaseStyle.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const Gap(BaseSpacing.spacing4),
                BaseTextField(
                  controller: userController,
                  // prefix: MyAssets.icons.user.svg(),
                  labelText: 'Tài khoản',
                  hintText: 'Nhập tài khoản',
                ),
                const Gap(BaseSpacing.spacing4),
                BaseTextField(
                  controller: passWorkController,
                  labelText: 'Mật khẩu',
                  hintText: 'Nhập mật khẩu đăng nhập',
                  // prefix: MyAssets.icons.unlockOtp.svg(),
                  keyboardType: TextInputType.visiblePassword,
                  // suffix: InkWell(
                  //   onTap: () {
                  //     isObscureText.value = !isObscureText.value;
                  //   },
                  //   child: isObscureText.value
                  //       ? MyAssets.icons.eye.svg()
                  //       : MyAssets.icons.eyeSlash.svg(),
                  // ),
                  obscureText: isObscureText.value,
                ),
                const Gap(BaseSpacing.spacing4),
                BaseSolidButton(
                  label: 'Đăng nhập',
                  onPressed:
                      isUserControllerNotEmpty && isPassWorkControllerNotEmpty
                          ? () {
                              ref.read(loginProvider.notifier).login(
                                url: '/v1/auth/login',
                                request: {
                                  'username': userController.text,
                                  'deviceId': passWorkController.text,
                                },
                              );
                            }
                          : null,
                ),
                const Gap(BaseSpacing.spacing4),
                // const Spacer(),
                BaseTextButton(
                  label: 'Đăng ký tài khoản',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
