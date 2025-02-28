part of '../../../ioc_contact_request.dart';

class IOCContactRequestService {
  final IOCContactRequestRepository contactRequestRepository;

  IOCContactRequestService(this.contactRequestRepository);

  static String iocContactRequest = '/ioc-contact-request';
  static String iocContactRequestDetail = '/ioc-contact-request-detail';
}
