import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/modules/safety_and_privacy/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SafetyAndPrivacyBody extends StatelessWidget {
  SafetyAndPrivacyBody({super.key});
  final controller = Get.find<SafetyAndPrivacyController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: Get.width,
      color: Colors.red.shade200,
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 15,
      ),
      child: Center(
        child: BaseText(
          text: 'This page still under maintenance',
          bold: FontWeight.w600,
          color: Colors.red.shade800,
        ),
      ),
    );
  }
}
