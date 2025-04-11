part of '../../../../ioc_contact_request.dart';

List<Option> typePapers = [
  Option(
    label: 'MST',
    value: 1,
  ),
  Option(
    label: 'CCCD',
    value: 2,
  ),
  Option(
    label: 'CMND',
    value: 3,
  ),
];

class Option<T> {
  String label;

  T value;

  Option({
    required this.label,
    required this.value,
  });
}

enum FileTypes { pdf, image, other }

enum FailByType { address, name, all, none }

extension FailByTypeExtension on FailByType {
  static FailByType getType(String data) {
    switch (data) {
      case "adress":
        return FailByType.address;
      case "name":
        return FailByType.name;
      default:
        return FailByType.none;
    }
  }
}

enum SourceInfoType { cim, cat }
extension SourceInfoTypeExtension on SourceInfoType {
  static SourceInfoType getType(String data) {
    switch (data) {
      case "CIM":
        return SourceInfoType.cim;
      case "CAT":
        return SourceInfoType.cat;
      default:
        return SourceInfoType.cat;
    }
  }
}