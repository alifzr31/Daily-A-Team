import 'package:dailyateam/app/data/models/karyawan.dart';
import 'package:get/get.dart';

class EmployeeInfoController extends GetxController {
  final profile = Rx<Karyawan?>(null);

  @override
  void onInit() {
    profile.value = Get.arguments['profile'];
    super.onInit();
  }
}
