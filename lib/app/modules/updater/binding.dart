import 'package:dailyateam/app/modules/updater/controller.dart';
import 'package:get/get.dart';

class UpdaterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdaterController());
  }
}