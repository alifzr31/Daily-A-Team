import 'package:dailyateam/app/data/providers/clockinout_provider.dart';
import 'package:dailyateam/app/data/providers/dashboard_provider.dart';
import 'package:dailyateam/app/modules/clock_in_out/controller.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:get/get.dart';

class ClockInOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClockInOutProvider());
    Get.lazyPut(() => ClockInOutController(clockInOutProvider: Get.find()));

    Get.lazyPut(() => DashboardProvider());
    Get.lazyPut(() => DashboardController(dashboardProvider: Get.find()));
  }
}