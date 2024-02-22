import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

void showLoading() {
  Get.dialog(
    barrierDismissible: false,
    Center(
      child: Lottie.asset(
        'assets/lotties/loading.json',
        width: 200,
        frameRate: FrameRate(240),
      ),
    ),
  );
}
