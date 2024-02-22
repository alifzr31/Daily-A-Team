import 'package:dailyateam/app/data/providers/approve_provider.dart';
import 'package:dailyateam/app/modules/approve/controller.dart';
import 'package:get/get.dart';

class ApproveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApproveProvider());
    Get.lazyPut(() => ApproveController(approveProvider: Get.find()));
  }
}