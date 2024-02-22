import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/modules/requests/time_off/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeOffHeader extends StatelessWidget {
  TimeOffHeader({super.key});
  final controller = Get.find<TimeOffController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Material(
        color: Colors.white,
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        child: Container(
          width: Get.width,
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade600,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              BaseText(
                text: 'Cuti Tahunan',
                size: 12,
                color: Colors.grey.shade600,
              ),
              controller.cutiBalance.value == null
                  ? BaseShimmer(
                      child: Container(
                        height: 20,
                        width: 80,
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    )
                  : BaseText(
                      text: '${controller.cutiBalance.value} Days',
                      size: 18,
                      bold: FontWeight.w500,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
