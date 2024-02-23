import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/dashboard/components/home/menu_item.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: controller.levKar.value == null ? 200 : 310,
        width: Get.width,
        margin: controller.levKar.value == null
            ? null
            : const EdgeInsets.only(bottom: 8),
        child: Stack(
          children: [
            Container(
              height: 250,
              width: Get.width,
              color: navyColor,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BaseText(
                            text: 'PT Anyar Retail Indonesia',
                            color: Colors.white,
                            bold: FontWeight.w600,
                          ),
                          BaseText(
                            text: controller.currentDate.value ?? '',
                            size: 12,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BaseText(
                                  text: '${controller.greeting.value}, ',
                                  color: Colors.white,
                                ),
                                controller.profile.value == null
                                    ? BaseShimmer(
                                        child: Container(
                                          height: 15,
                                          width: 150,
                                          margin: const EdgeInsets.only(top: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                        ),
                                      )
                                    : BaseText(
                                        text: controller
                                                .profile.value?.namaLengkap ??
                                            '',
                                        size: 16,
                                        color: Colors.white,
                                        bold: FontWeight.w500,
                                      ),
                                const SizedBox(height: 10),
                                controller.todayAttendance.value == null
                                    ? BaseShimmer(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10.5,
                                          ),
                                          width: 103,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(3),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 1,
                                        ),
                                        decoration: BoxDecoration(
                                          color: controller.todayAttendance
                                                      .value?.jamMasuk ==
                                                  null
                                              ? Colors.red.shade100
                                              : Colors.green.shade100,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: BaseText(
                                          text: controller.todayAttendance.value
                                                      ?.jamMasuk ==
                                                  null
                                              ? controller.todayAttendance.value
                                                      ?.presensiStatus ??
                                                  'Tidak Hadir'
                                              : 'Hadir',
                                          color: controller.todayAttendance
                                                      .value?.jamMasuk ==
                                                  null
                                              ? Colors.red.shade700
                                              : Colors.green.shade700,
                                          bold: FontWeight.w500,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                          controller.profile.value == null
                              ? const BaseShimmer(
                                  child: CircleAvatar(
                                    radius: 35,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 35,
                                  backgroundColor: softBlue,
                                  foregroundColor: navyColor,
                                  backgroundImage:
                                      controller.profile.value?.photo == null ||
                                              controller.profile.value?.photo ==
                                                  '0' ||
                                              controller.profile.value?.photo ==
                                                  ''
                                          ? null
                                          : Image.network(
                                              '${ApiUrl.storageUrl}/${controller.profile.value?.photo}',
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                return loadingProgress == null
                                                    ? child
                                                    : const Center(
                                                        child:
                                                            CupertinoActivityIndicator(
                                                          color: navyColor,
                                                        ),
                                                      );
                                              },
                                            ).image,
                                  child:
                                      controller.profile.value?.photo == null ||
                                              controller
                                                      .profile.value?.photo ==
                                                  '0' ||
                                              controller.profile.value?.photo ==
                                                  ''
                                          ? BaseText(
                                              text: AppHelpers.avatarName(
                                                  controller.profile.value
                                                          ?.namaLengkap ??
                                                      ''),
                                              size: 26,
                                              bold: FontWeight.w600,
                                              textAlign: TextAlign.center,
                                            )
                                          : null,
                                ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseText(
                              text: 'Role',
                              size: 12,
                              color: Colors.grey.shade400,
                            ),
                            controller.profile.value == null
                                ? BaseShimmer(
                                    child: Container(
                                      height: 15,
                                      width: 120,
                                      margin: const EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  )
                                : BaseText(
                                    text: controller
                                            .profile.value?.jabatan?.nama ??
                                        '',
                                    color: Colors.white,
                                    bold: FontWeight.w500,
                                  ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            BaseText(
                              text: 'Branch',
                              size: 12,
                              color: Colors.grey.shade400,
                            ),
                            controller.profile.value == null
                                ? BaseShimmer(
                                    child: Container(
                                      height: 15,
                                      width: 120,
                                      margin: const EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  )
                                : BaseText(
                                    text: controller
                                            .profile.value?.cabang?.nama ??
                                        '',
                                    color: Colors.white,
                                    bold: FontWeight.w500,
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (controller.levKar.value != null)
              Positioned(
                bottom: 0,
                width: Get.width,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  margin: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 5,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: BaseText(
                            text: 'Request',
                            bold: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MenuItem(
                              bgColor: const Color(0xFFFDE9E9),
                              color: const Color(0xFFF55454),
                              icon: 'timeoff.svg',
                              label: 'Time Off',
                              onPressed: () => Get.toNamed('/timeOff'),
                            ),
                            MenuItem(
                              bgColor: const Color(0xFFE2F1FF),
                              color: const Color(0xFF2391FF),
                              icon: 'req_attendance.svg',
                              label: 'Attendance',
                              onPressed: () => Get.toNamed('/reqAttendance'),
                            ),
                            MenuItem(
                              bgColor: const Color(0xFFFEF2CC),
                              color: const Color(0xFFF2B542),
                              icon: 'overtime.svg',
                              label: 'Over Time',
                              onPressed: () => Get.toNamed(
                                '/overtime',
                                arguments: {
                                  'jamMasuk': controller
                                      .todayAttendance.value?.jamMasuk,
                                },
                              ),
                            ),
                            MenuItem(
                              bgColor: const Color(0xFFE2D4FF),
                              color: const Color(0xFF8062D6),
                              icon: 'change_shift.svg',
                              label: 'Ch. Shift',
                              onPressed: () => Get.toNamed('/changeShift'),
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
    );
  }
}
