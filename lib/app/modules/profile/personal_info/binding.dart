import 'package:dailyateam/app/modules/profile/personal_info/controller.dart';
import 'package:get/get.dart';

class PersonalInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalInfoController());
  }
}