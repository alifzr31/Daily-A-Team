import 'package:dailyateam/app/modules/profile/employee_info/controller.dart';
import 'package:get/get.dart';

class EmployeeInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmployeeInfoController());
  }
}