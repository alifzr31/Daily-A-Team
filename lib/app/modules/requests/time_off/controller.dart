import 'dart:convert';

import 'package:dailyateam/app/core/utils/firebase_notif.dart';
import 'package:dailyateam/app/core/values/show_loading.dart';
import 'package:dailyateam/app/core/values/snackbars.dart';
import 'package:dailyateam/app/data/models/requests/choice_timeoff.dart';
import 'package:dailyateam/app/data/models/requests/log_timeoff.dart';
import 'package:dailyateam/app/data/providers/requests/timeoff_provider.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeOffController extends GetxController {
  final TimeOffProvider timeOffProvider;

  TimeOffController({required this.timeOffProvider});

  final firebaseNotif = FirebaseNotif();
  final currentTab = 0.obs;
  final idKaryawan = Rx<int?>(null);

  final cutiBalance = Rx<String?>(null);

  final formKey = GlobalKey<FormState>().obs;
  final dateController = TextEditingController().obs;
  final selectedDateString = Rx<String?>(null);
  final selectedDate = Rx<DateTime?>(null);
  final selectedReason = Rx<String?>(null);
  final selectedSubReason = Rx<String?>(null);
  final notesController = TextEditingController().obs;
  final picture = Rx<XFile?>(null);

  final choiceLoading = true.obs;
  final choice = <ChoiceTimeOff>[].obs;
  final subChoice = <Obj>[].obs;

  final logLoading = true.obs;
  final timeOff = <LogTimeOff>[].obs;

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    idKaryawan.value = sharedPreferences.getInt('kar_id');

    await fetchCuti();
    await fetchChoice();
    await fetchLogTimeOff();
    super.onInit();
  }

  @override
  void onClose() {
    choice.clear();
    subChoice.clear();
    timeOff.clear();
    dateController.value.dispose();
    notesController.value.dispose();
    super.onClose();
  }

  Future<void> fetchCuti() async {
    try {
      final response = await timeOffProvider.fetchCuti(idKaryawan.value);

      if (response.statusCode == 200) {
        cutiBalance.value = response.data['data']['sisa_cuti'].toString();
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Fetching Cuti Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      update();
    }
  }

  Future<void> fetchChoice() async {
    try {
      final response = await timeOffProvider.fetchChoice();

      if (response.statusCode == 200) {
        final List<ChoiceTimeOff> body = response.data['data'] == null
            ? []
            : listChoiceTimeOffFromJson(jsonEncode(response.data['data']));

        choice.value = body;
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Fetching Choice Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      choiceLoading.value = false;
      update();
    }
  }

  Future<void> fetchLogTimeOff() async {
    try {
      final response = await timeOffProvider.fetchLogTimeOff(idKaryawan.value);

      if (response.statusCode == 200) {
        final List<LogTimeOff> body = response.data['data'] == null
            ? []
            : listLogTimeOffFromJson(jsonEncode(response.data['data']));

        timeOff.value = body;
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Fetching Log Failed',
        'Oooppss something wrong. code:${e.response?.statusCode}',
      );
    } finally {
      logLoading.value = false;
      update();
    }
  }

  Future<void> refreshLogTimeOff() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      logLoading.value = true;
      timeOff.value = [];
      fetchLogTimeOff();
    });
  }

  Future<void> refreshForm() async {
    await Future.delayed(const Duration(milliseconds: 2500), () async {
      cutiBalance.value = null;
      choiceLoading.value = true;
      choice.value = [];
      await fetchCuti();
      await fetchChoice();
    });
  }

  void postTimeOff() async {
    final formData = dio.FormData.fromMap({
      if (picture.value != null)
        'dokumen': await dio.MultipartFile.fromFile(picture.value?.path ?? ''),
      'tanggal': selectedDateString.value,
      'tanggal_akhir': selectedDateString.value,
      'statusoff': selectedSubReason.value,
      'id_karyawan': idKaryawan.value,
      if (notesController.value.text.isNotEmpty)
        'ket': notesController.value.text,
      'tkn': await firebaseNotif.getDeviceToken(),
    });

    showLoading();

    try {
      final response = await timeOffProvider.postTimeOff(formData);

      if (response.statusCode == 200) {
        Get.back();
        Get.back();
        successSnackbar(
          'Request Time Off Success',
          response.data['message'],
        );
      }
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 400) {
        infoSnackbar(
          'Request Time Off Failed',
          '${e.response?.data['message']}',
        );
      } else if (e.response?.statusCode == 422) {
        infoSnackbar(
          'Request Time Off Failed',
          '${e.response?.data['message']}',
        );
      } else {
        failedSnackbar(
          'Request Time Off Failed',
          'Oooppss something went wrong. code:${e.response?.statusCode}',
        );
      }
    }
  }

  void cancelTimeOff(idTimeOff) async {
    final formData = dio.FormData.fromMap({
      'id_offtime': idTimeOff,
    });

    showLoading();

    try {
      final response = await timeOffProvider.cancelTimeOff(formData);

      if (response.statusCode == 200) {
        await fetchLogTimeOff().then((value) {
          update();
          Get.back();
          Get.back();
        });
        successSnackbar(
          'Cancel Req Time Off Success',
          'Your request time off has been canceled',
        );
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Cancel Req Time Off Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    }
  }
}
