import 'dart:convert';

import 'package:dailyateam/app/core/values/snackbars.dart';
import 'package:dailyateam/app/data/models/schedule.dart';
import 'package:dailyateam/app/data/providers/schedule_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScheduleController extends GetxController {
  final ScheduleProvider scheduleProvider;

  ScheduleController({required this.scheduleProvider});

  final idKaryawan = Rx<int?>(null);
  final isLoading = true.obs;
  final schedule = <Schedule>[].obs;

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    idKaryawan.value = sharedPreferences.getInt('kar_id');
    fetchSchedule();
    super.onInit();
  }

  @override
  void onClose() {
    schedule.clear();
    super.onClose();
  }

  Future<void> fetchSchedule() async {
    try {
      final response = await scheduleProvider.fetchSchedule(idKaryawan.value);

      if (response.statusCode == 200) {
        final List<Schedule> body = response.data['data'] == null
            ? []
            : listScheduleFromJson(jsonEncode(response.data['data']));

        schedule.value = body;
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Fetching Schedule Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> refreshSchedule() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      isLoading.value = true;
      schedule.value = [];
      fetchSchedule();
    });
  }
}
