import 'package:intl/intl.dart';

class AppHelpers {
  static final passwordValidation = RegExp(r'^(?=.*[A-Z])(?=.*[0-9])');

  static String maskEmail(String email) {
    List<String> parts = email.split('@');
    String username = parts[0];
    String domain = parts[1];
    String maskedUsername = username.substring(0, 2) +
        '*' * (username.length - 3) +
        username.substring(username.length - 1);
    return '$maskedUsername@$domain';
  }

  static String maskPhoneNumber(String phoneNumber) {
    String maskedPhoneNumber = phoneNumber.substring(0, 3) +
        '*' * (phoneNumber.length - 5) +
        phoneNumber.substring(phoneNumber.length - 2);
    return maskedPhoneNumber;
  }

  static String rupiahFormat(int currency) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    );

    return formatter.format(currency).replaceAll(',00', ',-');
  }

  static String dateFormat(DateTime dateTime) {
    final formatter = DateFormat('dd MMMM yyyy');
    return formatter.format(dateTime);
  }

  static String dateTimeFormat(DateTime dateTime) {
    final formatter = DateFormat('dd MMMM yyyy').add_Hm();
    return formatter.format(dateTime);
  }

  static String dayDateFormat(DateTime dateTime) {
    final formatter = DateFormat('E, dd MMMM yyyy');
    return formatter.format(dateTime);
  }

  static String timeFormat(DateTime dateTime) {
    final formatter = DateFormat('HH:mm:ss');
    return formatter.format(dateTime);
  }

  static String avatarName(String fullName) {
    if (fullName != '') {
      List<String> nameParts = fullName.split(' ');
      String firstWordName = nameParts[0][0];
      String? secondWordName = nameParts.length > 1 ? nameParts[1][0] : null;

      return secondWordName == null
          ? firstWordName
          : '$firstWordName$secondWordName';
    } else {
      return fullName;
    }
  }

  static String descAnnouncement(String text) {
    RegExp linkRegExp = RegExp(r'<p>(https?:\/\/[\w\/.\-?=%]+)<\/p>');

    return text.replaceFirstMapped(linkRegExp,
        (match) => "<a href='${match.group(1)}'>${match.group(1)}</a>");
  }

  static String convertDuration(String duration) {
    List<String> timeParts = duration.split(':');

    int hours = int.parse(timeParts[0]);
    int minutes = int.parse(timeParts[1]);
    int seconds = int.parse(timeParts[2]);

    int totalMinutes = (hours * 60) + minutes;

    int convertedHours = totalMinutes ~/ 60;
    int convertedMinutes = totalMinutes % 60;

    String hourUnit = hours > 1 ? 'hours' : 'hour';
    String minuteUnit = minutes > 1 ? 'minutes' : 'minute';
    String secondUnit = seconds > 1 ? 'seconds' : 'second';

    return minutes == 0
        ? '$convertedHours $hourUnit'
        : seconds == 0
            ? '$convertedHours $hourUnit $convertedMinutes $minuteUnit'
            : '$convertedHours $hourUnit $convertedMinutes $minuteUnit $seconds $secondUnit';
  }
}
