part of '../../utils.dart';

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool inRange(DateTime startDate, DateTime endDate) {
    return (isAfter(startDate.removeTime()) || isSameDate(startDate)) &&
        (isBefore(endDate.setEndOfDate()) || isSameDate(endDate));
  }

  DateTime removeTime() {
    return DateUtils.dateOnly(this);
  }

  DateTime setEndOfDate() {
    return copyWith(hour: 23, minute: 59, second: 59);
  }

  DateTime setTimeToCurrent() {
    final currentDateTime = DateTime.now();
    return copyWith(
        hour: currentDateTime.hour,
        minute: currentDateTime.minute,
        second: currentDateTime.second,
        millisecond: currentDateTime.millisecond,
        microsecond: currentDateTime.microsecond);
  }

  String formatLocalDateToGlobalTimeString() {
    try {
      final globalSourceFormat = DateFormat(Patterns.regexTimeServer);

      return globalSourceFormat.format(toUtc());
    } on Exception catch (ex) {
      LogUtils.e(ex);
      return "";
    }
  }

  String formatTimeString(String format) {
    try {
      final sourceFormat = DateFormat(format);

      return sourceFormat.format(this);
    } on Exception catch (ex) {
      LogUtils.e(ex);
      return "";
    }
  }

  int localDateToTimeStampUtc() {
    try {
      return millisecondsSinceEpoch ~/ 1000;
    } on Exception {
      return 0;
    }
  }

  String display({
    String format = Patterns.dateFormatVi,
  }) {
    return DateFormat(format).format(this);
  }

  bool get isWeekend {
    return weekday == 6 || weekday == 7;
  }

  getFormat({String? pattern, String? locale = 'vi'}) {
    return DateFormat(pattern, locale).format(toLocal());
  }
}
