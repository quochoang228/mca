class Patterns {
  static RegExp alphaRegExp = RegExp(r'^[a-zA-Z]+$');

  static String regexTimeServer = "yyyy-MM-dd'T'HH:mm:ss'Z'";

  /// ----------------- DATE TIME -----------------///
  /// Dùng để hiển thị
  static const String dateFormatVi = "dd/MM/yyyy";
  static String dateTimeFormatVi = "dd/MM/yyyy HH:mm:ss";
  static String dateTimeFormatView = "dd/MM/yyyy HH:mm";
  static String cartDateTimeFormat = "HH:mm:ss, dd/MM/yyyy";
  static String cartFormat = "HH:mm-dd/MM/yyyy";
  static String eventFormat = "HH:mm dd/MM/yyyy";
  static String rewardPointsFormat = "HH:mm dd-MM-yyyy";
  static String eventHour = "HH:mm";
  static String eventDate = "dd/MM";
  static String eventLiveStreamFormat = "HH:mm dd/MM";
  static String eventLiveStreamDate = "HH:mm-dd/MM/yyyy";
  static String eventLiveStreamTime = "HH:mm";
  static String financeTimeFormat = "dd/MM/yyyy";

  /// Format date from server và to server;
  static String dateTimeFormat = "yyyy-MM-dd";
  static String dateTimeFormatNormal = "yyyy-MM-dd HH:mm:ss";
  static String fullDateTimeFormat = "yyyy-MM-dd'T'hh:mm:ss.SSSZ";
  static String fullDateTimeKPI = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
  static String dateTimeFormatMission = "yyyyMMdd";

  /// ----------------- DATE TIME -----------------///

  static String url =
      r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';

  static String phone = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  static List<String> phonePrefix = <String>[
    // viettel
    '032', '033', '034', '035', '036', '037', '038', '039', '096', '098', '086',
    '097',
    // mobi
    '070', '079', '077', '076', '078', '090', '089', '093',
    // vina
    '083', '084', '085', '081', '082', '088', '091', '094',
    // vnmb
    '052', '056', '058', '092',
    // gmobile
    '059', '099',
    // itelecom
    '087',
  ];

  static String email =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static String password = r"^(?=.*?[a-z])(?=.*?\d).{8,16}$"; //8-16,a,1
  //r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#\$&*~]).{8,16}$' -> 8-16, A, a, @

  static String image = r'.(jpeg|jpg|gif|png|bmp)$';

  /// Audio regex
  static String audio = r'.(mp3|wav|wma|amr|ogg)$';

  /// Video regex
  static String video = r'.(mp4|avi|wmv|rmvb|mpg|mpeg|3gp|mkv)$';

  /// Txt regex
  static String txt = r'.txt$';

  /// Document regex
  static String doc = r'.(doc|docx)$';

  /// Excel regex
  static String excel = r'.(xls|xlsx)$';

  /// PPT regex
  static String ppt = r'.(ppt|pptx)$';

  /// Document regex
  static String apk = r'.apk$';

  /// PDF regex
  static String pdf = r'.pdf$';

  /// HTML regex
  static String html = r'.html$';
}
