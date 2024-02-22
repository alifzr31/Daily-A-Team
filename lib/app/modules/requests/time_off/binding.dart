import 'package:dailyateam/app/data/providers/requests/timeoff_provider.dart';
import 'package:dailyateam/app/modules/requests/time_off/controller.dart';
import 'package:get/get.dart';

class TimeOffBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TimeOffProvider());
    Get.lazyPut(() => TimeOffController(timeOffProvider: Get.find()));
  }
}