import 'package:dailyateam/app/data/providers/team_provider.dart';
import 'package:dailyateam/app/modules/team/controller.dart';
import 'package:get/get.dart';

class TeamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeamProvider());
    Get.lazyPut(() => TeamController(teamProvider: Get.find()));
  }
}