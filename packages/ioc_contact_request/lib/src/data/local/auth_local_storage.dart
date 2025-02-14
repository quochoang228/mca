part of '../../../ioc_contact_request.dart';

abstract class IOCContactRequestLocalStorageKeys {
  static const key = '__user_storage_key__';
}

abstract class IOCContactRequestLocalStorage {
  Future<void> setValue(String value);
}

class IOCContactRequestLocalStorageImpl
    implements IOCContactRequestLocalStorage {
  const IOCContactRequestLocalStorageImpl({
    required SharedPreferencesStorage storage,
  }) : _storage = storage;

  final SharedPreferencesStorage _storage;

  /// Sets authToken in Storage.
  @override
  Future<void> setValue(String value) => _storage.write(
        key: IOCContactRequestLocalStorageKeys.key,
        value: value,
      );
}
