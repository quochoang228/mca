part of '../../../ioc_contact_request.dart';

abstract class IOCContactRequestRepository {
  Future<BaseResult<ListDataResponse<IocContactRequestB2B>>> getListContactB2B({
    required Map<String, dynamic> request,
  });

  Future<BaseResult<DataResponse<IocContactRequestB2B>>> getContactDetailB2B({
    required Map<String, dynamic> request,
  });

  Future<BaseResult<ListDataResponse<AppParam>>> getDataBranch();

  Future<BaseResult<ListDataResponse<AppParam>>> getAllByParType({
    required Map<String, dynamic> request,
  });

  Future<BaseResult<ListDataResponse<AppParam>>> getAppParamByParType({
    required Map<String, dynamic> request,
  });

  Future<void> setValue(String value);
}

class IOCContactRequestRepositoryImpl extends BaseRepository implements IOCContactRequestRepository {
  IOCContactRequestRepositoryImpl({
    required IOCContactRequestApi api,
    required IOCContactRequestLocalStorage localStorage,
  })  : _api = api,
        _localStorage = localStorage;

  final IOCContactRequestApi _api;
  final IOCContactRequestLocalStorage _localStorage;

  @override
  Future<BaseResult<ListDataResponse<IocContactRequestB2B>>> getListContactB2B({
    required Map<String, dynamic> request,
  }) async {
    try {
      return await safeApiCall(
        _api.getListContactB2B(request: request),
        mapper: (data) {
          return ListDataResponse<IocContactRequestB2B>.fromJson(
            data,
            (Object? obj) => IocContactRequestB2B.fromMap(obj as Map<String, dynamic>),
          );
        },
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<BaseResult<DataResponse<IocContactRequestB2B>>> getContactDetailB2B({
    required Map<String, dynamic> request,
  }) async {
    try {
      return await safeApiCall(
        _api.getContactDetailB2B(request: request),
        mapper: (data) {
          return DataResponse<IocContactRequestB2B>.fromJson(
            data,
            (Object? obj) => IocContactRequestB2B.fromMap(obj as Map<String, dynamic>),
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

  @override
  Future<BaseResult<ListDataResponse<AppParam>>> getDataBranch() async {
    try {
      return await safeApiCall(
        _api.getDataBranch(),
        mapper: (data) {
          return ListDataResponse<AppParam>.fromJson(
            data,
            (Object? obj) => AppParam.fromJson(obj as Map<String, dynamic>),
          );
        },
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<BaseResult<ListDataResponse<AppParam>>> getAllByParType({required Map<String, dynamic> request}) async {
    try {
      return await safeApiCall(
        _api.getAllByParType(request: request),
        mapper: (data) {
          return ListDataResponse<AppParam>.fromJson(
            data,
            (Object? obj) => AppParam.fromJson(obj as Map<String, dynamic>),
          );
        },
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<BaseResult<ListDataResponse<AppParam>>> getAppParamByParType({required Map<String, dynamic> request}) async {
    try {
      return await safeApiCall(
        _api.getAppParamByParType(request: request),
        mapper: (data) {
          return ListDataResponse<AppParam>.fromJson(
            data,
            (Object? obj) => AppParam.fromJson(obj as Map<String, dynamic>),
          );
        },
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
