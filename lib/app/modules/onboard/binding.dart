import 'package:dailyateam/app/modules/onboard/controller.dart';
import 'package:get/get.dart';

class OnboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardController());
  }
}
