import 'dart:async';

import 'package:camera/camera.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:dailyateam/app/core/utils/firebase_notif.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/core/values/show_loading.dart';
import 'package:dailyateam/app/core/values/snackbars.dart';
import 'package:dailyateam/app/data/providers/clockinout_provider.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class ClockInOutController extends GetxController {
  final ClockInOutProvider clockInOutProvider;

  ClockInOutController({required this.clockInOutProvider});

  final firebaseNotif = FirebaseNotif();
  final userController = Get.find<DashboardController>();

  final image = Rx<XFile?>(null);
  final imageSize = Rx<int?>(null);
  final currentTime = AppHelpers.timeFormat(DateTime.now()).obs;

  final servicestatus = false.obs;
  final haspermission = false.obs;
  final lat = Rx<double?>(null);
  final long = Rx<double?>(null);
  final streamPosition = Rx<StreamSubscription<Position>?>(null);

  @override
  void onInit() {
    image.value = Get.arguments['image'];
    imageSize.value = Get.arguments['imageSize'];
    startTimer();
    fetchLocation();
    super.onInit();
  }

  @override
  void onClose() {
    streamPosition.value?.cancel();
    super.onClose();
  }

  Future<void> fetchLocation() async {
    try {
      late Position position;
      late LocationPermission permission;

      servicestatus.value = await Geolocator.isLocationServiceEnabled();

      if (servicestatus.value) {
        permission = await Geolocator.checkPermission();

        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();

          if (permission == LocationPermission.denied) {
            permission = await Geolocator.requestPermission();
          } else if (permission == LocationPermission.deniedForever) {
            permission = await Geolocator.requestPermission();
          } else {
            haspermission.value = true;
          }
        } else {
          haspermission.value = true;
        }

        if (haspermission.value) {
          position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
          );

          lat.value = position.latitude;
          long.value = position.longitude;

          const locationSetting = LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 100,
          );

          streamPosition.value =
              Geolocator.getPositionStream(locationSettings: locationSetting)
                  .listen((pos) {
            lat.value = pos.latitude;
            long.value = pos.longitude;
          });

          update();
        }
      } else {
        infoSnackbar(
          'GPS Tidak Aktif',
          'Silahkan nyalakan gps(lokasi) perangkat anda terlebih dahulu',
        );
      }
    } catch (e) {
      failedSnackbar(
        'Fetching Location Failed',
        'Error: $e',
      );
    } finally {
      update();
    }
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1),
        (timer) => currentTime.value = AppHelpers.timeFormat(DateTime.now()));
  }

  void clockInOut(BuildContext context) async {
    final formData = dio.FormData.fromMap({
      'image_masuk': await dio.MultipartFile.fromFile(image.value?.path ?? ''),
      'nik': userController.profile.value?.nomorIndukKaryawan,
      'latitude': lat.value,
      'longitude': long.value,
      'tkn': await firebaseNotif.getDeviceToken(),
    });

    await fetchLocation();

    if (lat.value != null && long.value != null) {
      showLoading();

      try {
        final response = await clockInOutProvider.clockInOut(formData);

        if (response.statusCode == 200) {
          Get.back();

          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            loopAnimation: false,
            confirmBtnText: 'Okay',
            barrierDismissible: false,
            confirmBtnColor: navyColor,
            closeOnConfirmBtnTap: true,
            title: 'Absen Berhasil',
            text: response.data['message'],
            onConfirmBtnTap: () async {
              Get.back();
              userController.todayAttendance.value = null;
              userController.noClockOut.value = [];
              userController.noClockOutLoading.value = true;
              userController.todayBreak.value = null;
              userController.todayBreakLoading.value = true;
              await userController.fetchLogAttendance();
              await userController.fetchBreakTime();
            },
          );
        }
      } on dio.DioException catch (e) {
        Get.back();

        if (imageSize.value! > 1000000) {
          infoSnackbar(
            'Absen Gagal',
            'Ukuran file foto terlalu besar',
          );
        } else {
          if (e.response?.data['code'] == 'warning4') {
            infoSnackbar('Anda Sudah Absen', e.response?.data['message'] ?? '');
          } else {
            failedSnackbar('Absen Gagal', e.response?.data['message'] ?? '');
          }
        }
      }
    }
  }
}
