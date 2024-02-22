import 'dart:convert';

import 'package:dailyateam/app/core/values/show_loading.dart';
import 'package:dailyateam/app/core/values/snackbars.dart';
import 'package:dailyateam/app/data/models/approves/req_attendance.dart';
import 'package:dailyateam/app/data/models/approves/req_changeshift.dart';
import 'package:dailyateam/app/data/models/approves/req_overtime.dart';
import 'package:dailyateam/app/data/models/approves/req_timeoff.dart';
import 'package:dailyateam/app/data/providers/approve_provider.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

class ApproveController extends GetxController {
  final ApproveProvider approveProvider;

  ApproveController({required this.approveProvider});

  final icons = [
    'req_attendance.svg',
    'timeoff.svg',
    'change_shift.svg',
    'overtime.svg',
  ].obs;

  final labels = [
    'Attendance',
    'Time Off',
    'Change Shift',
    'Overtime',
  ].obs;

  final reqAttendanceLoading = true.obs;
  final reqAttendance = <ReqAttendance>[].obs;

  final reqTimeOffLoading = true.obs;
  final reqTimeOff = <ReqTimeOff>[].obs;

  final reqChangeShiftLoading = true.obs;
  final reqChangeShift = <ReqChangeShift>[].obs;

  final reqOvertimeLoading = true.obs;
  final reqOvertime = <ReqOvertime>[].obs;

  @override
  void onInit() async {
    await fetchReqAttendance();
    await fetchReqTimeOff();
    await fetchReqChangeShift();
    await fetchReqOvertime();
    super.onInit();
  }

  @override
  void onClose() {
    reqAttendance.clear();
    reqTimeOff.clear();
    reqChangeShift.clear();
    reqOvertime.clear();
    super.onClose();
  }

  Future<void> fetchReqAttendance() async {
    try {
      final response = await approveProvider.fetchReqAttendance();

      if (response.statusCode == 200) {
        final List<ReqAttendance> body = response.data['data'] == null
            ? []
            : listReqAttendanceFromJson(jsonEncode(response.data['data']));

        reqAttendance.value = body;
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Fetching Req Attendance Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      reqAttendanceLoading.value = false;
      update();
    }
  }

  Future<void> refreshReqAttendance() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      reqAttendanceLoading.value = true;
      reqAttendance.clear();
      fetchReqAttendance();
    });
  }

  void approveReqAttendance({
    required String date,
    required String name,
    required String status,
    required int idReqAttendance,
  }) async {
    final formData = dio.FormData.fromMap({
      'tanggal': date,
      'nama': name,
      'stsapp': status,
    });

    showLoading();

    try {
      final response = await approveProvider.approveReqAttendance(
        formData,
        idReqAttendance,
      );

      if (response.statusCode == 200) {
        await fetchReqAttendance();
        Get.back();
        if (reqAttendance.isEmpty) {
          Get.back();
          Get.back();
        } else {
          Get.back();
        }

        if (status == 'approve') {
          successSnackbar(
            'Approve Req Attendance Success',
            'Request attendance has been approved',
          );
        } else {
          successSnackbar(
            'Reject Req Attendance Success',
            'Request attendance has been rejected',
          );
        }
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Approve Req Attendance Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    }
  }

  Future<void> fetchReqTimeOff() async {
    try {
      final response = await approveProvider.fetchReqTimeOff();

      if (response.statusCode == 200) {
        final List<ReqTimeOff> body = response.data['data'] == null
            ? []
            : listReqTimeOffFromJson(jsonEncode(response.data['data']));

        reqTimeOff.value = body;
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Fetching Req Time Off Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      reqTimeOffLoading.value = false;
      update();
    }
  }

  Future<void> refreshReqTimeOff() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      reqTimeOffLoading.value = true;
      reqTimeOff.clear();
      fetchReqTimeOff();
    });
  }

  void approveReqTimeOff({
    required String date,
    required String status,
    required int idReqATimeOff,
  }) async {
    final formData = dio.FormData.fromMap({
      'tanggal_approve': date,
      'status_approve': status,
    });

    showLoading();

    try {
      final response = await approveProvider.approveReqTimeOff(
        formData,
        idReqATimeOff,
      );

      if (response.statusCode == 200) {
        await fetchReqTimeOff();
        Get.back();
        if (reqTimeOff.isEmpty) {
          Get.back();
          Get.back();
        } else {
          Get.back();
        }

        if (status == 'approve') {
          successSnackbar(
            'Approve Req Time Off Success',
            'Request time off has been approved',
          );
        } else {
          successSnackbar(
            'Reject Req Time Off Success',
            'Request time off has been rejected',
          );
        }
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Approve Req Time Off Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    }
  }

  Future<void> fetchReqChangeShift() async {
    try {
      final response = await approveProvider.fetchReqChangeShift();

      if (response.statusCode == 200) {
        final List<ReqChangeShift> body = response.data['0'] == null
            ? []
            : listReqChangeShiftFromJson(jsonEncode(response.data['0']));

        reqChangeShift.value = body;
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Fetching Req Change Shift Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      reqChangeShiftLoading.value = false;
      update();
    }
  }

  Future<void> refreshReqChangeShift() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      reqChangeShiftLoading.value = true;
      reqChangeShift.clear();
      fetchReqChangeShift();
    });
  }

  void approveReqChangeShift({
    required int idReqChangeShift,
    required String status,
  }) async {
    final formData = dio.FormData.fromMap({
      'idshift': idReqChangeShift,
      'stsapp': status,
    });

    showLoading();

    try {
      final response = await approveProvider.approveReqChangeShift(formData);

      if (response.statusCode == 200) {
        await fetchReqChangeShift();
        Get.back();
        if (reqChangeShift.isEmpty) {
          Get.back();
          Get.back();
        } else {
          Get.back();
        }

        if (status == 'approve') {
          successSnackbar(
            'Approve Req Change Shift Success',
            'Request change shift has been approved',
          );
        } else {
          successSnackbar(
            'Reject Req Change Shift Success',
            'Request change shift has been rejected',
          );
        }
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Approve Req Change Shift Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    }
  }

  Future<void> fetchReqOvertime() async {
    try {
      final response = await approveProvider.fetchReqOvertime();

      if (response.statusCode == 200) {
        final List<ReqOvertime> body = response.data['0'] == null
            ? []
            : listReqOvertimeFromJson(jsonEncode(response.data['0']));

        reqOvertime.value = body;
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Fetching Req Overtime Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      reqOvertimeLoading.value = false;
      update();
    }
  }

  Future<void> refreshReqOvertime() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      reqOvertimeLoading.value = true;
      reqOvertime.clear();
      fetchReqOvertime();
    });
  }

  void approveReqOvertime({
    required int idOvertime,
    required String status,
  }) async {
    final formData = dio.FormData.fromMap({
      'status_approve': status,
      'id_ovtime': idOvertime,
    });

    showLoading();

    try {
      final response = await approveProvider.approveReqOvertime(formData);

      if (response.statusCode == 200) {
        await fetchReqOvertime();
        Get.back();
        if (reqOvertime.isEmpty) {
          Get.back();
          Get.back();
        } else {
          Get.back();
        }

        if (status == 'approve') {
          successSnackbar(
            'Approve Req Overtime Success',
            'Request overtime has been approved',
          );
        } else {
          successSnackbar(
            'Reject Req Overtime Success',
            'Request overtime has been rejected',
          );
        }
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Approve Req Overtime Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    }
  }
}
