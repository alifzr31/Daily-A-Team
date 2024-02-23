import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/components/base_textbutton.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/profile/payroll_info/components/earningdeduction_box.dart';
import 'package:dailyateam/app/modules/profile/payroll_info/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayrollInfoDetail extends StatelessWidget {
  PayrollInfoDetail({super.key});
  final controller = Get.find<PayrollInfoController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            EarningDeductionBox(
              basicSalary: 10048000,
              transport: 1000000,
              makan: 3000000,
              alpha: 200000,
              isLoading: controller.isLoading.value,
            ),
            const SizedBox(height: 30),
            const BaseText(
              text: 'Take Home Pay',
              size: 14,
              color: Colors.red,
              bold: FontWeight.w500,
            ),
            controller.isLoading.value
                ? BaseShimmer(
                    child: Container(
                      height: 20,
                      width: 150,
                      margin: const EdgeInsets.only(
                        top: 1,
                        bottom: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  )
                : BaseText(
                    text: AppHelpers.rupiahFormat(13848000),
                    size: 18,
                    bold: FontWeight.w600,
                  ),
            if (controller.isLoading.isFalse)
              BaseTextButton(
                text: 'Download Slip Payroll',
                size: 12,
                color: navyColor,
                onPressed: () {},
              ),
          ],
        ),
      ),
    );
  }
}
