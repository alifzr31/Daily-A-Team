import 'package:dailyateam/app/data/providers/breaktime_provider.dart';
import 'package:dailyateam/app/modules/break_time/controller.dart';
import 'package:get/get.dart';

class BreakTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BreakTimeProvider());
    Get.lazyPut(() => BreakTimeController(breakTimeProvider: Get.find()));
  }
}