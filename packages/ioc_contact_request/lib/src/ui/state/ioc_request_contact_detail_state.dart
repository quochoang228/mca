part of '../../../ioc_contact_request.dart';

class IocContactRequestDetailState {
  final List<AppParam> listBranch;
  final List<AppParam> partnerGroup;
  final List<AppParam> paramDataSources;
  final IocContactRequestB2B detail;
  final bool isLoading;
  final String? error;

  IocContactRequestDetailState({
    required this.listBranch,
    required this.partnerGroup,
    required this.paramDataSources,
    required this.detail,
    this.isLoading = false,
    this.error,
  });

  IocContactRequestDetailState copyWith({
    List<AppParam>? listBranch,
    List<AppParam>? partnerGroup,
    List<AppParam>? paramDataSources,
    IocContactRequestB2B? detail,
    bool? isLoading,
    String? error,
  }) {
    return IocContactRequestDetailState(
      listBranch: listBranch ?? this.listBranch,
      partnerGroup: partnerGroup ?? this.partnerGroup,
      paramDataSources: paramDataSources ?? this.paramDataSources,
      detail: detail ?? this.detail,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
