part of '../../../ioc_contact_request.dart';

abstract class IOCContactRequestRepository {
  Future<BaseResult<ListDataResponse<IocContactRequestDto>>> getList({
    required Map<String, dynamic> request,
  });

  Future<void> setValue(String value);
}

class IOCContactRequestRepositoryImpl extends BaseRepository
    implements IOCContactRequestRepository {
  IOCContactRequestRepositoryImpl({
    required IOCContactRequestApi api,
    required IOCContactRequestLocalStorage localStorage,
  })  : _api = api,
        _localStorage = localStorage;

  final IOCContactRequestApi _api;
  final IOCContactRequestLocalStorage _localStorage;

  @override
  Future<BaseResult<ListDataResponse<IocContactRequestDto>>> getList({
    required Map<String, dynamic> request,
  }) async {
    try {
      return await safeApiCall(
        _api.getList(request: request),
        mapper: (data) {
          return ListDataResponse<IocContactRequestDto>.fromJson(
            data,
            (Object? obj) =>
                IocContactRequestDto.fromJson(obj as Map<String, dynamic>),
          );
        },
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<void> setValue(String value) async {
    try {
      await _localStorage.setValue(value);
    } catch (error, _) {
      LogUtils.e(error.toString());
    }
  }
}
