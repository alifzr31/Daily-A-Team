import 'dart:io';

import 'package:dailyateam/app/components/base_button.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/clock_in_out/controller.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class ClockInOutBody extends StatelessWidget {
  ClockInOutBody({super.key});
  final controller = Get.find<ClockInOutController>();
  final userController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage:
                          Image.file(File(controller.image.value?.path ?? ''))
                              .image,
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 250,
                      width: Get.width,
                      child: Material(
                        color: Colors.white,
                        elevation: 1,
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BaseText(
                                          text: userController
                                                  .profile.value?.namaLengkap ??
                                              '',
                                          size: 16,
                                          bold: FontWeight.w600,
                                        ),
                                        BaseText(
                                          text: userController
                                                  .profile.value?.jabatan?.nama ??
                                              '',
                                          bold: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(
                                    MingCute.user_3_line,
                                    size: 35,
                                  ),
                                ],
                              ),
                              Divider(
                                height: 15,
                                color: Colors.grey.shade300,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        const Icon(MingCute.IDcard_line),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              BaseText(
                                                text: 'Employee ID',
                                                size: 12,
                                                color: Colors.grey.shade600,
                                              ),
                                              BaseText(
                                                text: userController.profile.value
                                                        ?.nomorIndukKaryawan ??
                                                    '',
                                                bold: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              BaseText(
                                                text: 'Current Time',
                                                size: 12,
                                                color: Colors.grey.shade600,
                                              ),
                                              BaseText(
                                                text:
                                                    controller.currentTime.value,
                                                bold: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Icon(MingCute.time_line),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: Get.width,
              child: BaseButton(
                bgColor: navyColor,
                fgColor: Colors.white,
                label: 'Upload Photo',
                onPressed: () async {
                  await controller.fetchLocation();
                  controller.clockInOut(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
