import 'package:dailyateam/app/data/providers/profile/payrollinfo_provider.dart';
import 'package:dailyateam/app/modules/profile/payroll_info/controller.dart';
import 'package:get/get.dart';

class PayrollInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PayrollInfoProvider());
    Get.lazyPut(() => PayrollInfoController(payrollInfoProvider: Get.find()));
  }
}