import 'package:dailyateam/app/data/models/karyawan.dart';
import 'package:get/get.dart';

class DetailEmployeeController extends GetxController {
  final currentTab = 0.obs;
  final employee = Rx<Karyawan?>(null);

  @override
  void onInit() {
    employee.value = Get.arguments['employee'];
    super.onInit();
  }
}
