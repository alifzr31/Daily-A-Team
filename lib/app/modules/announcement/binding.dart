import 'package:dailyateam/app/data/providers/announcement_provider.dart';
import 'package:dailyateam/app/modules/announcement/controller.dart';
import 'package:get/get.dart';

class AnnouncementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnnouncementProvider());
    Get.lazyPut(() => AnnouncementController(announcementProvider: Get.find()));
  }
}