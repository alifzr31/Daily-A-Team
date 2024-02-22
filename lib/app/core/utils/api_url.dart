class ApiUrl {
  static const String baseUrl = 'https://staging.anyargroup.co.id/api';
  static const String storageUrl = 'https://staging.anyargroup.co.id/storage';
  static EndPoint endPoint = EndPoint();
}

class EndPoint {
  static const String login = '/login';
  static const String logout = '/logout';

  static const String levKar = '/kar/level_karyawan';
  static const String profile = '/profile';
  static const String announcement = '/announ';
  static const String employee = '/apikar';
  static const String inboxStaff = '/inbox/subor';
  static const String markReadStaff = '/inbox/marksubor';
  static const String inboxManager = '/inbox/manager';
  static const String markReadManager = '/inbox/markmanager';
  static const String changePhotoProfile = '/profile/changephoto';

  static const String schedule = '/getshifkar';

  static const String breakTime = '/getbreaktime';
  static const String postBreaktime = '/reqattend/savebreak';

  static const String logAttendance = '/getpresensi';

  static const String clockInOut = '/presensi';

  static const String fetchCuti = '/getcutikaryawan';
  static const String postTimeOff = '/timeoff/store';
  static const String choiceTimeOff = '/timeoff/listchoicetimeoff';
  static const String logTimeOff = '/timeoff/getlistoff';
  static const String cancelTimeOff = '/timeoff/canceltimeoff';

  static const String logReqAttendance = '/reqattend/karreqattend';
  static const String postReqAttendance = '/reqattend/savereqattend';
  static const String cancelReqAttendance = '/reqattend/cancelreqpres';

  static const String postOvertime = '/over/overstore';
  static const String logOvertime = '/over/getoverkar';

  static const String fetchOffice = '/shift/getparam';
  static const String postChangeShift = '/shift/changeshift';
  static const String logChangeShift = '/shift/getchangeshift';
  static const String cancelChangeShift = '/shift/cancelchangeshift';

  static const String fetchReqAttendance = '/reqattend/indexreqattend';
  static const String approveReqAttendance = '/reqattend/approvereqattend';
  static const String fetchTimeOff = '/timeoff/levjab';
  static const String approveReqTimeOff = '/timeoff/approvetimeoff';
  static const String fetchChangeShift = '/shift/leadchshift';
  static const String approveReqChangeShift = '/shift/changeshiftapp';
  static const String fetchReqOvertime = '/over/leadindexovertime';
  static const String approveReqOvertime = '/over/overtimeapproval';

  static const String team = '/apipressub';

  static const String changePassword = '/changepass';
}

class EndPointStorage {
  static const String timeOff = '/berkastimeoff';
}
