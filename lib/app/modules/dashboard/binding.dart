import 'package:dailyateam/app/data/providers/dashboard_provider.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardProvider());
    Get.lazyPut(() => DashboardController(dashboardProvider: Get.find()));
  }
}