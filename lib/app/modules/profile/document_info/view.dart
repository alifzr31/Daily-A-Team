import 'package:dailyateam/app/components/base_appbar.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentInfoPage extends StatelessWidget {
  const DocumentInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: Colors.white,
        fgColor: navyColor,
        title: 'Documents Info',
      ),
      body: Container(
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
      ),
    );
  }
}
