import 'package:dailyateam/app/data/providers/dashboard_provider.dart';
import 'package:dailyateam/app/data/providers/profile/changepassword_provider.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:dailyateam/app/modules/profile/change_password/controller.dart';
import 'package:get/get.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordProvider());
    Get.lazyPut(() => ChangePasswordController(changePasswordProvider: Get.find()));

    Get.lazyPut(() => DashboardProvider());
    Get.lazyPut(() => DashboardController(dashboardProvider: Get.find()));
  }
}