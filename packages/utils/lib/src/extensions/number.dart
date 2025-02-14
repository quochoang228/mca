part of '../../utils.dart';

extension NumberExtension on num {
  String toMoneyString() {
    final oCcy = NumberFormat("#,##0.##", Intl.systemLocale);
    return oCcy.format(this);
  }

  String getDateYMMMEdFromTimestamp() {
    return DateFormat.yMMMEd().format(
      (toInt() * 1000).timestampConversion(),
    );
  }

  DateTime timestampConversion() {
    return DateTime.fromMillisecondsSinceEpoch(
      toInt(),
    );
  }
}
