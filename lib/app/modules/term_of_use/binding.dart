import 'package:dailyateam/app/modules/term_of_use/controller.dart';
import 'package:get/get.dart';

class TermOfUseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TermOfUseController());
  }
}