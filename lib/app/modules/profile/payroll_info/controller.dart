import 'package:dailyateam/app/data/providers/profile/payrollinfo_provider.dart';
import 'package:get/get.dart';

class PayrollInfoController extends GetxController {
  final PayrollInfoProvider payrollInfoProvider;

  PayrollInfoController({required this.payrollInfoProvider});

  final period = [
    'Januari 2024',
    'Februari 2024',
    'Maret 2024',
    'April 2024',
  ].obs;
  final selectedPeriod = Rx<String?>(null);

  final name = Rx<String?>(null);
  final jabatan = Rx<String?>(null);
  final photo = Rx<String?>(null);

  final isLoading = true.obs;

  @override
  void onInit() {
    selectedPeriod.value = 'April 2024';
    name.value = Get.arguments['name'];
    jabatan.value = Get.arguments['jabatan'];
    photo.value = Get.arguments['photo'];
    fetchPayroll();
    super.onInit();
  }

  Future<void> fetchPayroll() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {
      isLoading.value = false;
    });
  }

  Future<void> refreshPayroll() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      isLoading.value = true;
      selectedPeriod.value = 'April 2024';
      fetchPayroll();
    });
  }
}