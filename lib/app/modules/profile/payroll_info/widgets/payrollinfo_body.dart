import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/modules/profile/payroll_info/controller.dart';
import 'package:dailyateam/app/modules/profile/payroll_info/widgets/payrollinfo_detail.dart';
import 'package:dailyateam/app/modules/profile/payroll_info/widgets/payrollinfo_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayrollInfoBody extends StatelessWidget {
  PayrollInfoBody({super.key});
  final controller = Get.find<PayrollInfoController>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.refreshPayroll,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
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
            PayrollInfoHeader(),
            PayrollInfoDetail(),
          ],
        ),
      ),
    );
  }
}
