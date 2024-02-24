import 'dart:convert';

import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/show_loading.dart';
import 'package:dailyateam/app/core/values/snackbars.dart';
import 'package:dailyateam/app/data/models/requests/log_changeshift.dart';
import 'package:dailyateam/app/data/models/requests/office.dart';
import 'package:dailyateam/app/data/models/schedule.dart';
import 'package:dailyateam/app/data/providers/requests/changeshift_provider.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeShiftController extends GetxController {
  final ChangeShiftProvider changeShiftProvider;

  ChangeShiftController({required this.changeShiftProvider});

  final currentTab = 0.obs;
  final idKaryawan = Rx<int?>(null);

  final scheduleLoading = true.obs;
  final schedule = <Schedule>[].obs;
  final officeLoading = true.obs;
  final office = <Office>[].obs;
  final formKey = GlobalKey<FormState>().obs;
  final dateController = TextEditingController().obs;
  final selectedDate = Rx<DateTime?>(null);
  final selectedDateString = Rx<String?>(null);
  final fromShift = Rx<String?>(null);
  final selectedShift = Rx<String?>(null);
  final offDateController = TextEditingController().obs;
  final selectedOffDate = Rx<DateTime?>(null);
  final selectedOffDateString = Rx<String?>(null);
  final reasonController = TextEditingController().obs;

  final logLoading = true.obs;
  final changeShift = <LogChangeShift>[].obs;

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    idKaryawan.value = sharedPreferences.getInt('kar_id');

    await fetchSchedule();
    await fetchLogChangeShift();

    if (Get.arguments != null) {
      dateController.value.text =
          AppHelpers.dayDateFormat(Get.arguments['date']);
      selectedDateString.value =
          DateFormat('yyyy-MM-dd').format(Get.arguments['date']);
      selectedDate.value =
          DateFormat('yyyy-MM-dd').parse(selectedDateString.value ?? '');
      fromShift.value = Get.arguments['fromShift'];
      await fetchOffice();
    }
    super.onInit();
  }

  @override
  void onClose() {
    schedule.clear();
    changeShift.clear();
    office.clear();
    dateController.value.dispose();
    offDateController.value.dispose();
    reasonController.value.dispose();
    super.onClose();
  }

  Future<void> fetchSchedule() async {
    try {
      final response =
          await changeShiftProvider.fetchSchedule(idKaryawan.value);

      if (response.statusCode == 200) {
        final List<Schedule> body = response.data['data'] == null
            ? []
            : listScheduleFromJson(jsonEncode(response.data['data']));

        schedule.value = body;
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Fetching Schedule Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      scheduleLoading.value = false;
      update();
    }
  }

  Future<void> fetchOffice() async {
    try {
      final response = await changeShiftProvider.fetchOffice();

      if (response.statusCode == 200) {
        final List<Office> body = response.data['0'] == null
            ? []
            : listOfficeFromJson(jsonEncode(response.data['0']));

        office.value = body
            .where((element) => element.jenisShift != fromShift.value)
            .toList();
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Fetching Office Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      officeLoading.value = false;
      update();
    }
  }

  Future<void> refreshForm() async {
    await Future.delayed(const Duration(milliseconds: 2500), () async {
      scheduleLoading.value = true;
      officeLoading.value = true;
      schedule.clear();
      office.clear();
      dateController.value.text = '';
      selectedDateString.value = null;
      selectedDate.value = null;
      fromShift.value = null;
      selectedShift.value = null;
      offDateController.value.text = '';
      selectedOffDateString.value = null;
      selectedOffDate.value = null;
      await fetchSchedule();
    });
  }

  void chooseDate(DateTime date) {
    dateController.value.text = AppHelpers.dayDateFormat(date);
    selectedDateString.value = DateFormat('yyyy-MM-dd').format(date);
    selectedDate.value =
        DateFormat('yyyy-MM-dd').parse(selectedDateString.value ?? '');
    fromShift.value = null;
    fromShift.value = schedule
            .firstWhereOrNull(
                (element) => element.tanggal == selectedDate.value)
            ?.parampresensi
            ?.jenisShift ??
        '';
    selectedShift.value = null;
    officeLoading.value = true;
    offDateController.value.text = '';
    selectedOffDateString.value = null;
    selectedOffDate.value = null;
    office.clear();
    fetchOffice();
  }

  void chooseOffDate(DateTime date) {
    offDateController.value.text = AppHelpers.dayDateFormat(date);
    selectedOffDateString.value = DateFormat('yyyy-MM-dd').format(date);
    selectedOffDate.value =
        DateFormat('yyyy-MM-dd').parse(selectedDateString.value ?? '');
  }

  void postChangeShift() async {
    final formData = dio.FormData.fromMap({
      'startdate': selectedDateString.value,
      'shift_awal': fromShift.value,
      'enddate': selectedDateString.value,
      'shift_akhir': selectedShift.value,
      if (selectedOffDateString.value != null)
        'tgl_off': selectedOffDateString.value,
      'keterangan': reasonController.value.text,
      'id_karyawan': idKaryawan.value,
    });

    showLoading();

    try {
      final response = await changeShiftProvider.postChangeShift(formData);

      if (response.statusCode == 200) {
        Get.back();
        Get.back();
        successSnackbar(
          'Req Change Shift Success',
          response.data.toString(),
        );
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Req Change Shift Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    }
  }

  Future<void> fetchLogChangeShift() async {
    try {
      final response =
          await changeShiftProvider.fetchLogChangeShift(idKaryawan.value);

      if (response.statusCode == 200) {
        final List<LogChangeShift> body = response.data['data'] == null
            ? []
            : listLogChangeShiftFromJson(jsonEncode(response.data['data']));

        changeShift.value = body;
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Fetching Log Change Shift Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      logLoading.value = false;
      update();
    }
  }

  Future<void> refreshLogChangeShift() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      logLoading.value = true;
      changeShift.clear();
      fetchLogChangeShift();
    });
  }

  void cancelChangeShift(idChangeShift) async {
    final formData = dio.FormData.fromMap({
      'id_changeshift': idChangeShift,
    });

    showLoading();

    try {
      final response = await changeShiftProvider.cancelChangeShift(formData);

      if (response.statusCode == 200) {
        await fetchLogChangeShift().then((value) {
          update();
          Get.back();
          Get.back();
        });

        successSnackbar(
          'Cancel Req Change Shift Success',
          'Your request change schedule has been canceled',
        );
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Cancel Req Change Schedule Failed',
        'Oops something went wrong. ERR_CODE(${e.response?.statusCode})',
      );
    }
  }
}
