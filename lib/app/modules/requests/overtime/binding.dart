import 'package:dailyateam/app/data/providers/requests/overtime_provider.dart';
import 'package:dailyateam/app/modules/requests/overtime/controller.dart';
import 'package:get/get.dart';

class OvertimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OvertimeProvider());
    Get.lazyPut(() => OvertimeController(overtimeProvider: Get.find()));
  }
}