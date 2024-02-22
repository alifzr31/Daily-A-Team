import 'package:dailyateam/app/data/providers/requests/reqattendance_provider.dart';
import 'package:dailyateam/app/modules/requests/req_attendance/controller.dart';
import 'package:get/get.dart';

class ReqAttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReqAttendanceProvider());
    Get.lazyPut(() => ReqAttendanceController(reqAttendanceProvider: Get.find()));
  }
}