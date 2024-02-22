import 'dart:convert';

import 'package:dailyateam/app/core/values/show_loading.dart';
import 'package:dailyateam/app/core/values/snackbars.dart';
import 'package:dailyateam/app/data/models/requests/log_overtime.dart';
import 'package:dailyateam/app/data/models/schedule.dart';
import 'package:dailyateam/app/data/providers/requests/overtime_provider.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OvertimeController extends GetxController {
  final OvertimeProvider overtimeProvider;

  OvertimeController({required this.overtimeProvider});

  final currentTab = 0.obs;
  final idKaryawan = Rx<int?>(null);

  final scheduleLoading = true.obs;
  final jamLoading = true.obs;
  final schedule = <Schedule>[].obs;
  final todaySchedule = Rx<Schedule?>(null);
  final jamMasukArgument = Rx<DateTime?>(null);
  final jamPulang = Rx<int?>(null);

  final formKey = GlobalKey<FormState>().obs;
  final dateController = TextEditingController().obs;
  final selectedDate = Rx<DateTime?>(null);
  final selectedDateString = Rx<String?>(null);
  final startController = TextEditingController().obs;
  final selectedStart = Rx<DateTime?>(null);
  final endController = TextEditingController().obs;
  final selectedEnd = Rx<DateTime?>(null);
  final compensations = [
    'Paid',
    'Off',
  ].obs;
  final selectedCompensation = Rx<String?>(null);
  final reasonController = TextEditingController().obs;

  final logLoading = true.obs;
  final overtime = <LogOvertime>[].obs;

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    idKaryawan.value = sharedPreferences.getInt('kar_id');
    jamMasukArgument.value = Get.arguments['jamMasuk'];

    await fetchSchedule();
    await fetchLogOvertime();
    super.onInit();
  }

  @override
  void onClose() {
    overtime.clear();
    dateController.value.dispose();
    startController.value.dispose();
    endController.value.dispose();
    reasonController.value.dispose();
    super.onClose();
  }

  Future<void> fetchSchedule({DateTime? date}) async {
    try {
      final response = await overtimeProvider.fetchSchedule(idKaryawan.value);

      if (response.statusCode == 200) {
        final List<Schedule> body = response.data['data'] == null
            ? []
            : listScheduleFromJson(jsonEncode(response.data['data']));

        schedule.value = body;

        if (date != null) {
          todaySchedule.value =
              body.firstWhereOrNull((element) => element.tanggal == date);
          final timeParts =
              todaySchedule.value?.parampresensi?.jamPulang?.split(':');
          jamPulang.value = int.parse(timeParts?[0] ?? '0');
        }
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Fetching Schedule Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      scheduleLoading.value = false;
      jamLoading.value = false;
      update();
    }
  }

  void postOvertime() async {
    final formData = dio.FormData.fromMap({
      'tanggal_overtime': selectedDateString,
      'mulai': startController.value.text,
      'akhir': endController.value.text,
      'kompensasi': selectedCompensation.value,
      'note': reasonController.value.text,
    });

    showLoading();

    try {
      final response = await overtimeProvider.postOvertime(formData);

      if (response.statusCode == 200) {
        Get.back();
        Get.back();
        successSnackbar(
          'Req Overtime Success',
          response.data['message'],
        );
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Req Overtime Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    }
  }

  Future<void> fetchLogOvertime() async {
    try {
      final response = await overtimeProvider.fetchLogOvertime();

      if (response.statusCode == 200) {
        final List<LogOvertime> body = response.data['data'] == null
            ? []
            : listLogOvertimeFromJson(jsonEncode(response.data['data']));

        overtime.value = body;
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Fetching Log Overtime Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      logLoading.value = false;
      update();
    }
  }

  Future<void> refreshLogOvertime() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      logLoading.value = true;
      overtime.clear();
      fetchLogOvertime();
    });
  }
}
