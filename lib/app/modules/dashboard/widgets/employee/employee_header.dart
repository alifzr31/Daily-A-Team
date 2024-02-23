import 'package:dailyateam/app/components/base_formfield.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class EmployeeHeader extends StatelessWidget {
  EmployeeHeader({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      clipBehavior: Clip.antiAlias,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: BaseText(
                text: 'Employee',
                size: 20,
                bold: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            if (controller.employeeLoading.isFalse)
              BaseFormField(
                hint: 'Search Employee...',
                prefixIcon: const Icon(MingCute.search_3_line),
                isOutline: true,
                onChanged: (value) => controller.findEmployee(value ?? ''),
              ),
          ],
        ),
      ),
    );
  }
}
