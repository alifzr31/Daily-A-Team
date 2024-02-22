import 'package:dailyateam/app/data/providers/profile/documentinfo_provider.dart';
import 'package:dailyateam/app/modules/profile/document_info/controller.dart';
import 'package:get/get.dart';

class DocumentInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DocumentInfoProvider());
    Get.lazyPut(() => DocumentInfoController(documentInfoProvider: Get.find()));
  }
}