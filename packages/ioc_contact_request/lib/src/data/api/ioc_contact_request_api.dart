part of '../../../ioc_contact_request.dart';

abstract class IOCContactRequestApi {
  Future<Response> getList({
    required Map<String, dynamic> request,
  });
}

class IOCContactRequestApiImpl implements IOCContactRequestApi {
  final ApiGateway _apiGateway;

  IOCContactRequestApiImpl({
    required ApiGateway apiGateway,
  }) : _apiGateway = apiGateway;

  @override
  Future<Response> getList({
    required Map<String, dynamic> request,
  }) {
    return _apiGateway.post(
      '/getList',
      data: request,
    );
  }
}
