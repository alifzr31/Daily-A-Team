import 'package:dailyateam/app/modules/announcement/binding.dart';
import 'package:dailyateam/app/modules/announcement/view.dart';
import 'package:dailyateam/app/modules/approve/binding.dart';
import 'package:dailyateam/app/modules/approve/view.dart';
import 'package:dailyateam/app/modules/break_time/binding.dart';
import 'package:dailyateam/app/modules/break_time/view.dart';
import 'package:dailyateam/app/modules/clock_in_out/binding.dart';
import 'package:dailyateam/app/modules/clock_in_out/view.dart';
import 'package:dailyateam/app/modules/dashboard/binding.dart';
import 'package:dailyateam/app/modules/dashboard/view.dart';
import 'package:dailyateam/app/modules/detail_employee/binding.dart';
import 'package:dailyateam/app/modules/detail_employee/view.dart';
import 'package:dailyateam/app/modules/log_attendance/binding.dart';
import 'package:dailyateam/app/modules/log_attendance/view.dart';
import 'package:dailyateam/app/modules/login/binding.dart';
import 'package:dailyateam/app/modules/login/view.dart';
import 'package:dailyateam/app/modules/my_camera/binding.dart';
import 'package:dailyateam/app/modules/my_camera/view.dart';
import 'package:dailyateam/app/modules/onboard/binding.dart';
import 'package:dailyateam/app/modules/onboard/view.dart';
import 'package:dailyateam/app/modules/profile/change_password/binding.dart';
import 'package:dailyateam/app/modules/profile/change_password/view.dart';
import 'package:dailyateam/app/modules/profile/document_info/binding.dart';
import 'package:dailyateam/app/modules/profile/document_info/view.dart';
import 'package:dailyateam/app/modules/profile/employee_info/binding.dart';
import 'package:dailyateam/app/modules/profile/employee_info/view.dart';
import 'package:dailyateam/app/modules/profile/payroll_info/binding.dart';
import 'package:dailyateam/app/modules/profile/payroll_info/view.dart';
import 'package:dailyateam/app/modules/profile/personal_info/binding.dart';
import 'package:dailyateam/app/modules/profile/personal_info/view.dart';
import 'package:dailyateam/app/modules/requests/change_shift/binding.dart';
import 'package:dailyateam/app/modules/requests/change_shift/view.dart';
import 'package:dailyateam/app/modules/requests/overtime/binding.dart';
import 'package:dailyateam/app/modules/requests/overtime/view.dart';
import 'package:dailyateam/app/modules/requests/req_attendance/binding.dart';
import 'package:dailyateam/app/modules/requests/req_attendance/view.dart';
import 'package:dailyateam/app/modules/requests/time_off/binding.dart';
import 'package:dailyateam/app/modules/requests/time_off/view.dart';
import 'package:dailyateam/app/modules/safety_and_privacy/binding.dart';
import 'package:dailyateam/app/modules/safety_and_privacy/view.dart';
import 'package:dailyateam/app/modules/schedule/binding.dart';
import 'package:dailyateam/app/modules/schedule/view.dart';
import 'package:dailyateam/app/modules/splash/binding.dart';
import 'package:dailyateam/app/modules/splash/view.dart';
import 'package:dailyateam/app/modules/team/binding.dart';
import 'package:dailyateam/app/modules/team/view.dart';
import 'package:dailyateam/app/modules/term_of_use/binding.dart';
import 'package:dailyateam/app/modules/term_of_use/view.dart';
import 'package:dailyateam/app/modules/updater/binding.dart';
import 'package:dailyateam/app/modules/updater/view.dart';
import 'package:dailyateam/app/routes/routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.updater,
      page: () => const UpdaterPage(),
      binding: UpdaterBinding(),
    ),
    GetPage(
      name: Routes.onboard,
      page: () => const OnboardPage(),
      binding: OnboardBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.announcement,
      page: () => const AnnouncementPage(),
      binding: AnnouncementBinding(),
    ),
    GetPage(
      name: Routes.detailEmployee,
      page: () => const DetailEmployeePage(),
      binding: DetailEmployeeBinding(),
    ),
    GetPage(
      name: Routes.camera,
      page: () => const MyCameraPage(),
      binding: MyCameraBinding(),
    ),
    GetPage(
      name: Routes.clockInOut,
      page: () => const ClockInOutPage(),
      binding: ClockInOutBinding(),
    ),
    GetPage(
      name: Routes.schedule,
      page: () => const SchedulePage(),
      binding: ScheduleBinding(),
    ),
    GetPage(
      name: Routes.breakTime,
      page: () => const BreakTimePage(),
      binding: BreakTimeBinding(),
    ),
    GetPage(
      name: Routes.logAttendance,
      page: () => const LogAttendancePage(),
      binding: LogAttendanceBinding(),
    ),
    GetPage(
      name: Routes.timeOff,
      page: () => const TimeOffPage(),
      binding: TimeOffBinding(),
    ),
    GetPage(
      name: Routes.reqAttendance,
      page: () => const ReqAttendancePage(),
      binding: ReqAttendanceBinding(),
    ),
    GetPage(
      name: Routes.overtime,
      page: () => const OvertimePage(),
      binding: OvertimeBinding(),
    ),
    GetPage(
      name: Routes.changeShift,
      page: () => const ChangeShiftPage(),
      binding: ChangeShiftBinding(),
    ),
    GetPage(
      name: Routes.approve,
      page: () => const ApprovePage(),
      binding: ApproveBinding(),
    ),
    GetPage(
      name: Routes.team,
      page: () => const TeamPage(),
      binding: TeamBinding(),
    ),
    GetPage(
      name: Routes.personalInfo,
      page: () => const PersonalInfoPage(),
      binding: PersonalInfoBinding(),
    ),
    GetPage(
      name: Routes.employeeInfo,
      page: () => const EmployeeInfoPage(),
      binding: EmployeeInfoBinding(),
    ),
    GetPage(
      name: Routes.payrollInfo,
      page: () => const PayrollInfoPage(),
      binding: PayrollInfoBinding(),
    ),
    GetPage(
      name: Routes.documentInfo,
      page: () => const DocumentInfoPage(),
      binding: DocumentInfoBinding(),
    ),
    GetPage(
      name: Routes.changePassword,
      page: () => const ChangePasswordPage(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: Routes.termOfUse,
      page: () => const TermOfUsePage(),
      binding: TermOfUseBinding(),
    ),
    GetPage(
      name: Routes.safetyAndPrivacy,
      page: () => const SafetyAndPrivacyPage(),
      binding: SafetyAndPrivacyBinding(),
    ),
  ];
}
