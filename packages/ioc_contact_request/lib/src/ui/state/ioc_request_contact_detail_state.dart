// State tổng hợp tất cả dữ liệu của contact detail page
import '../../../ioc_contact_request.dart';
import '../../entities/app_param.dart';

class IocContactRequestDetailState {
  final List<AppParam> groups;
  final List<AppParam> paramGroups;
  final IocContactRequestB2B detail;
  final bool isLoading;
  final String? error;

  IocContactRequestDetailState({
    required this.groups,
    required this.paramGroups,
    required this.detail,
    this.isLoading = false,
    this.error,
  });

  IocContactRequestDetailState copyWith({
    List<AppParam>? groups,
    List<AppParam>? paramGroups,
    IocContactRequestB2B? detail,
    bool? isLoading,
    String? error,
  }) {
    return IocContactRequestDetailState(
      groups: groups ?? this.groups,
      paramGroups: paramGroups ?? this.paramGroups,
      detail: detail ?? this.detail,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
