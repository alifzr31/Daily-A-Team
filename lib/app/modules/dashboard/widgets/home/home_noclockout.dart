import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/dashboard/components/home/noclockout_card.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeNoClockOut extends StatelessWidget {
  HomeNoClockOut({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: controller.noClockOutLoading.value
            ? 120
            : controller.noClockOut.isEmpty
                ? 150
                : 120,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            elevation: 1,
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Container(
                  color: softBlue,
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BaseText(
                        text: 'No Clock Out',
                        bold: FontWeight.w600,
                      ),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(
                              text: controller.noClockOut.length.toString(),
                              style: TextStyle(
                                color: controller.noClockOut.isEmpty
                                    ? Colors.grey.shade600
                                    : Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: controller.noClockOut.length > 1
                                  ? ' times'
                                  : ' time',
                              style: TextStyle(
                                  color: controller.noClockOut.isEmpty
                                      ? Colors.grey.shade600
                                      : Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: controller.noClockOutLoading.value
                      ? ListView.builder(
                          padding: const EdgeInsets.all(15),
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return BaseShimmer(
                              child: NoClockOutCard(
                                date: DateTime(0000),
                                dataLength: 3,
                                index: index,
                              ),
                            );
                          },
                        )
                      : controller.noClockOut.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Lottie.asset(
                                    'assets/lotties/goodjob.json',
                                    width: 25,
                                    frameRate: FrameRate(144),
                                    repeat: false,
                                  ),
                                  const SizedBox(height: 10),
                                  const BaseText(
                                    text: 'Good Job!',
                                    size: 14,
                                    textAlign: TextAlign.center,
                                    bold: FontWeight.w600,
                                  ),
                                  BaseText(
                                    text:
                                        'You never forget to clock out',
                                    size: 12,
                                    textAlign: TextAlign.center,
                                    color: Colors.grey.shade600,
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.all(15),
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.noClockOut.length,
                              itemBuilder: (context, index) {
                                final noClockOut = controller.noClockOut[index];

                                return NoClockOutCard(
                                  date: noClockOut.tanggal ?? DateTime(0000),
                                  dataLength: controller.noClockOut.length,
                                  index: index,
                                );
                              },
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
