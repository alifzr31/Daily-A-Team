import 'package:dailyateam/app/modules/safety_and_privacy/controller.dart';
import 'package:get/get.dart';

class SafetyAndPrivacyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SafetyAndPrivacyController());
  }
}