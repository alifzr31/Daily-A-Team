import 'dart:convert';

import 'package:dailyateam/app/core/utils/firebase_notif.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/show_loading.dart';
import 'package:dailyateam/app/core/values/snackbars.dart';
import 'package:dailyateam/app/data/models/requests/log_reqattendance.dart';
import 'package:dailyateam/app/data/providers/requests/reqattendance_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReqAttendanceController extends GetxController {
  final ReqAttendanceProvider reqAttendanceProvider;

  ReqAttendanceController({required this.reqAttendanceProvider});

  final firebaseNotif = FirebaseNotif();
  final currentTab = 0.obs;
  final idKaryawan = Rx<int?>(null);

  final formKey = GlobalKey<FormState>().obs;
  final dateController = TextEditingController().obs;
  final timeController = TextEditingController().obs;
  final jenis = [
    'Masuk',
    'Pulang',
  ].obs;
  final selectedJenis = Rx<String?>(null);
  final reasonController = TextEditingController().obs;
  final selectedDate = Rx<DateTime?>(null);
  final selectedDateString = Rx<String?>(null);
  final selectedTime = Rx<DateTime?>(null);

  final logLoading = true.obs;
  final logReqAttendance = <LogReqAttendance>[].obs;

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    idKaryawan.value = sharedPreferences.getInt('kar_id');

    if (Get.arguments != null) {
      selectedDate.value = Get.arguments['date'];
      selectedJenis.value = Get.arguments['jenis'];
      selectedDateString.value =
          DateFormat('yyyy-MM-dd').format(Get.arguments['date']);
      dateController.value.text =
          AppHelpers.dayDateFormat(Get.arguments['date']);
    }
    fetchLogReqAttendance();
    super.onInit();
  }

  @override
  void onClose() {
    dateController.value.dispose();
    timeController.value.dispose();
    reasonController.value.dispose();
    logReqAttendance.clear();
    super.onClose();
  }

  void postReqAttendance() async {
    final formData = dio.FormData.fromMap({
      'tanggal': selectedDateString.value,
      'jam': timeController.value.text,
      'jenis': selectedJenis.value,
      'reason': reasonController.value.text,
      'id_karyawan': idKaryawan.value,
      'tkn': await firebaseNotif.getDeviceToken(),
    });

    showLoading();

    try {
      final response = await reqAttendanceProvider.postReqAttendance(formData);

      if (response.statusCode == 200) {
        Get.back();
        Get.back();
        successSnackbar(
          'Req Attendance Success',
          response.data['message'] ??
              'Your request attendance has been submited',
        );
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Req Attendance Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    }
  }

  Future<void> fetchLogReqAttendance() async {
    try {
      final response =
          await reqAttendanceProvider.fetchLogReqAttendance(idKaryawan.value);

      if (response.statusCode == 200) {
        final List<LogReqAttendance> body = response.data['data'] == null
            ? []
            : listLogReqAttendanceFromJson(jsonEncode(response.data['data']));

        logReqAttendance.value = body;
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Fetching Log Req Attendance Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      logLoading.value = false;
      update();
    }
  }

  Future<void> refreshLogReqAttendance() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      logLoading.value = true;
      logReqAttendance.value = [];
      fetchLogReqAttendance();
    });
  }

  void cancelReqAttendance(idRequest) async {
    final formData = dio.FormData.fromMap({
      'id_reqpres': idRequest,
    });

    showLoading();

    try {
      final response =
          await reqAttendanceProvider.cancelReqAttendance(formData);

      if (response.statusCode == 200) {
        await fetchLogReqAttendance().then((value) {
          update();
          Get.back();
        });

        successSnackbar(
          'Cancel Req Attendance Success',
          'Your request attendance has been canceled',
        );
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Cancel Req Attendance Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    }
  }
}
