import 'dart:convert';

import 'package:dailyateam/app/core/values/snackbars.dart';
import 'package:dailyateam/app/data/models/breaktime.dart';
import 'package:dailyateam/app/data/providers/breaktime_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BreakTimeController extends GetxController {
  final BreakTimeProvider breakTimeProvider;

  BreakTimeController({required this.breakTimeProvider});

  final idKaryawan = Rx<int?>(null);
  final isLoading = true.obs;
  final breakTime = <BreakTime>[].obs;

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    idKaryawan.value = sharedPreferences.getInt('kar_id');

    fetchBreakTime();
    super.onInit();
  }

  @override
  void onClose() {
    breakTime.clear();
    super.onClose();
  }

  Future<void> fetchBreakTime() async {
    try {
      final response = await breakTimeProvider.fetchBreakTime(idKaryawan.value);

      if (response.statusCode == 200) {
        final List<BreakTime> body = response.data['data'] == null
            ? []
            : listBreakTimeFromJson(jsonEncode(response.data['data']));

        breakTime.value = body;
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Fetching Break Time Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> refreshBreakTime() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      isLoading.value = true;
      breakTime.value = [];
      fetchBreakTime();
    });
  }
}
