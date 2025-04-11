part of '../../../ioc_contact_request.dart';

abstract class IOCContactRequestApi {
  Future<Response> getListContactB2B({
    required Map<String, dynamic> request,
  });

  Future<Response> getContactDetailB2B({
    required Map<String, dynamic> request,
  });

  Future<Response> getDataBranch();

  Future<Response> getAllByParType({
    required Map<String, dynamic> request,
  });

  Future<Response> getAppParamByParType({
    required Map<String, dynamic> request,
  });

  Future<Response> getListContactB2C({
    required Map<String, dynamic> request,
  });

  Future<Response> getContactDetailB2C({
    required Map<String, dynamic> request,
  });
}

class IOCContactRequestApiImpl implements IOCContactRequestApi {
  final ApiGateway _apiGateway;

  IOCContactRequestApiImpl({
    required ApiGateway apiGateway,
  }) : _apiGateway = apiGateway;

  @override
  Future<Response> getListContactB2B({
    required Map<String, dynamic> request,
  }) {
    return _apiGateway.post(
      '/contactB2b/search',
      data: request,
    );
  }

  @override
  Future<Response> getContactDetailB2B({
    required Map<String, dynamic> request,
  }) {
    return _apiGateway.get(
      '/contactB2b/findById',
      queryParameters: request,
    );
  }

  @override
  Future<Response> getDataBranch() {
    return _apiGateway.get(
      '/app-param/get-all-branch-by-par-type',
    );
  }

  @override
  Future<Response> getAllByParType({required Map<String, dynamic> request}) {
    return _apiGateway.get(
      '/app-param/get-all-by-par-type',
      queryParameters: request,
    );
  }

  @override
  Future<Response> getAppParamByParType({required Map<String, dynamic> request}) {
    return _apiGateway.post(
      '/common/getAppParamByParType',
      data: request,
    );
  }


  @override
  Future<Response> getListContactB2C({
    required Map<String, dynamic> request,
  }) {
    return _apiGateway.post(
      '/contact/search',
      data: request,
    );
  }

  @override
  Future<Response> getContactDetailB2C({
    required Map<String, dynamic> request,
  }) {
    return _apiGateway.get(
      '/contact/findById',
      queryParameters: request,
    );
  }
}
