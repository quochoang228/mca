part of '../di.dart';

class Dependencies {
  static final Dependencies _instance = Dependencies._internal(GetIt.instance);

  final GetIt _getIt;

  factory Dependencies() => _instance;

  Dependencies._internal(this._getIt);

  GetIt get getIt => _getIt;

  /// Đăng ký dependency
  void registerSingleton<T extends Object>(T instance) {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerSingleton<T>(instance);
    }
  }

  void registerLazySingleton<T extends Object>(T Function() factory) {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerLazySingleton<T>(factory);
    }
  }

  void registerFactory<T extends Object>(T Function() factory) {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerFactory<T>(factory);
    }
  }

  /// Hủy đăng ký một dependency
  void unregister<T extends Object>() {
    if (_getIt.isRegistered<T>()) {
      _getIt.unregister<T>();
    }
  }
}
