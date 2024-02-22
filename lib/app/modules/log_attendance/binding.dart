import 'package:dailyateam/app/data/providers/logattendance_provider.dart';
import 'package:dailyateam/app/modules/log_attendance/controller.dart';
import 'package:get/get.dart';

class LogAttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogAttendanceProvider());
    Get.lazyPut(() => LogAttendanceController(logAttendanceProvider: Get.find()));
  }
}