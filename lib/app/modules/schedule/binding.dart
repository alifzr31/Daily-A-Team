import 'package:dailyateam/app/data/providers/schedule_provider.dart';
import 'package:dailyateam/app/modules/schedule/controller.dart';
import 'package:get/get.dart';

class ScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScheduleProvider());
    Get.lazyPut(() => ScheduleController(scheduleProvider: Get.find()));
  }
}