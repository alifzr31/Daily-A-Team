import 'package:dailyateam/app/data/providers/login_provider.dart';
import 'package:dailyateam/app/modules/login/controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginProvider());
    Get.lazyPut(() => LoginController(loginProvider: Get.find()));
  }
}