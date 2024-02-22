import 'dart:convert';

import 'package:dailyateam/app/core/values/snackbars.dart';
import 'package:dailyateam/app/data/models/log_attendance.dart';
import 'package:dailyateam/app/data/providers/logattendance_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LogAttendanceController extends GetxController {
  final LogAttendanceProvider logAttendanceProvider;

  LogAttendanceController({required this.logAttendanceProvider});

  final isLoading = true.obs;
  final logAttendance = <LogAttendance>[].obs;
  final attendance = Rx<LogAttendance?>(null);
  final lateAttendance = <Presensi>[].obs;
  final noOutAttendance = <Presensi>[].obs;
  final choosePeriod = 1.obs;
  final periodName = Rx<String?>(null);

  @override
  void onInit() async {
    await fetchLogAttendance();
    await fetchLateAttendance();
    await fetchNoOutAttendance();
    super.onInit();
  }

  @override
  void onClose() {
    logAttendance.clear();
    lateAttendance.clear();
    noOutAttendance.clear();
    super.onClose();
  }

  Future<void> fetchLogAttendance() async {
    try {
      final response = await logAttendanceProvider.fetchLogAttendance();

      if (response.statusCode == 200) {
        final List<LogAttendance> body = response.data['data'] == null
            ? []
            : listLogAttendanceFromJson(jsonEncode(response.data['data']));

        logAttendance.value = body;
        attendance.value = body
            .firstWhere((element) => element.periodeNo == choosePeriod.value);
        List<String> parts = attendance.value?.periode?.split("sd") ?? [];

        if (parts.length == 2) {
          String datePart = parts[1].trim();
          final parsed = DateFormat('dd MMMM yyyy').parse(datePart);
          periodName.value = DateFormat('MMMM').format(parsed);
        }
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Fetching Log Attendance Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> changePeriod(int periodNo) async {
    choosePeriod.value = periodNo;
    attendance.value = logAttendance
        .firstWhere((element) => element.periodeNo == choosePeriod.value);
    List<String> parts = attendance.value?.periode?.split("sd") ?? [];

    if (parts.length == 2) {
      String datePart = parts[1].trim();
      final parsed = DateFormat('dd MMMM yyyy').parse(datePart);
      periodName.value = DateFormat('MMMM').format(parsed);
    }
  }

  Future<void> fetchLateAttendance() async {
    lateAttendance.value = attendance.value!.presensi!
        .where((element) => element.presensiStatus == 'LateIn')
        .toList();
  }

  Future<void> fetchNoOutAttendance() async {
    final now = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    noOutAttendance.value = attendance.value!.presensi!
        .where((element) =>
            element.jamMasuk != null &&
            element.jamPulang == null &&
            element.tanggal != now)
        .toList();
  }

  Future<void> refreshLogAttendance() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      isLoading.value = true;
      logAttendance.value = [];
      fetchLogAttendance();
    });
  }
}
