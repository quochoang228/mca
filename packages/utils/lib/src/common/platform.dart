import 'dart:io';

class MyPlatform {
  static bool get isAndroid => Platform.isAndroid;

  static bool get isDesktop =>
      MyPlatform.isMacOS || MyPlatform.isWindows || MyPlatform.isLinux;

  static bool get isFuchsia => Platform.isFuchsia;

  static bool get isIOS => Platform.isIOS;

  static bool get isLinux => Platform.isLinux;

  static bool get isMacOS => Platform.isMacOS;

  static bool get isMobile => MyPlatform.isIOS || MyPlatform.isAndroid;

  static bool get isWindows => Platform.isWindows;
}
