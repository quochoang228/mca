import 'dart:async';

import 'package:base_ui/base_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../router/paths.dart';

class SplashPage extends StatefulHookConsumerWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashState();
}

class _SplashState extends ConsumerState<SplashPage> {
  double percent = 0.0;
  Timer? timer;
  int _start = 1;
  final int _totalTime = 1;

  @override
  void initState() {
    super.initState();

// Set full screen mode
    // SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.immersive,
    //   overlays: [],
    // );

    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            getLocalUser();
          });
        } else {
          setState(() {
            _start--;
            percent = 1 - _start / _totalTime;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    // Restore system UI
    // SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.manual,
    //   overlays: SystemUiOverlay.values,
    // );
    super.dispose();
  }

  getLocalUser() async {
    // await ref.read(localUserProvider.notifier).fetchLocalUser();
    checkAuth();
  }

  void checkAuth() {
    // final token = ref.watch(tokenProvider);
    // final isKeepLogin = ref.watch(isKeepLoginProvider);
    // context.pushReplacement(
    // token.isEmpty ? Paths.login : (isKeepLogin ? Paths.root : Paths.login));
    context.pushReplacement(Paths.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoreColors.white,
      // appBar: AppBar(
      //   backgroundColor: JobbyColors.gray900,
      // ),
      body: Center(
        child: Text(
          'Super App Nội Bộ',
          style: TextStyle(
            color: CoreColors.black,
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
