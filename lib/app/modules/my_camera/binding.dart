import 'package:dailyateam/app/modules/my_camera/controller.dart';
import 'package:get/get.dart';

class MyCameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCameraController());
  }
}