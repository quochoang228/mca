part of '../../../ioc_contact_request.dart';

abstract class IOCContactRequestRepository {
  Future<BaseResult<ListDataResponse<IocContactRequest>>> getListContactB2B({
    required Map<String, dynamic> request,
  });

  Future<BaseResult<DataResponse<IocContactRequest>>> getContactDetailB2B({
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

  Future<BaseResult<ListDataResponse<IocContactRequest>>> getListContactB2C({
    required Map<String, dynamic> request,
  });

  Future<BaseResult<DataResponse<IocContactRequest>>> getContactDetailB2C({
    required Map<String, dynamic> request,
  });
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
  Future<BaseResult<ListDataResponse<IocContactRequest>>> getListContactB2B({
    required Map<String, dynamic> request,
  }) async {
    try {
      return await safeApiCall(
        _api.getListContactB2B(request: request),
        mapper: (data) {
          return ListDataResponse<IocContactRequest>.fromJson(
            data,
            (Object? obj) => IocContactRequest.fromMap(obj as Map<String, dynamic>),
          );
        },
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<BaseResult<DataResponse<IocContactRequest>>> getContactDetailB2B({
    required Map<String, dynamic> request,
  }) async {
    try {
      return await safeApiCall(
        _api.getContactDetailB2B(request: request),
        mapper: (data) {
          return DataResponse<IocContactRequest>.fromJson(
            data,
            (Object? obj) => IocContactRequest.fromMap(obj as Map<String, dynamic>),
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

  @override
  Future<BaseResult<ListDataResponse<IocContactRequest>>> getListContactB2C({
    required Map<String, dynamic> request,
  }) async {
    try {
      return await safeApiCall(
        _api.getListContactB2C(request: request),
        mapper: (data) {
          return ListDataResponse<IocContactRequest>.fromJson(
            data,
            (Object? obj) => IocContactRequest.fromMap(obj as Map<String, dynamic>),
          );
        },
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<BaseResult<DataResponse<IocContactRequest>>> getContactDetailB2C({
    required Map<String, dynamic> request,
  }) async {
    try {
      return await safeApiCall(
        _api.getContactDetailB2C(request: request),
        mapper: (data) {
          return DataResponse<IocContactRequest>.fromJson(
            data,
                (Object? obj) => IocContactRequest.fromMap(obj as Map<String, dynamic>),
          );
        },
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
