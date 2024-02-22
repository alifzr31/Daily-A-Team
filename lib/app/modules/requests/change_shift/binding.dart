import 'package:dailyateam/app/data/providers/requests/changeshift_provider.dart';
import 'package:dailyateam/app/modules/requests/change_shift/controller.dart';
import 'package:get/get.dart';

class ChangeShiftBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangeShiftProvider());
    Get.lazyPut(() => ChangeShiftController(changeShiftProvider: Get.find()));
  }
}