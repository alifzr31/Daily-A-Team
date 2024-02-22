import 'package:dailyateam/app/modules/detail_employee/controller.dart';
import 'package:get/get.dart';

class DetailEmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailEmployeeController());
  }
}