import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/components/base_textbutton.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class AccountTabInfo extends StatelessWidget {
  AccountTabInfo({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: 2,
        child: Container(
          height: 260,
          width: Get.width,
          padding: const EdgeInsets.all(15),
          child: Material(
            color: Colors.white,
            elevation: 1,
            clipBehavior: Clip.antiAlias,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Column(
              children: [
                TabBar(
                  labelPadding: const EdgeInsets.symmetric(vertical: 5),
                  onTap: (index) => controller.tabInfoIndex.value = index,
                  tabs: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(controller.tabInfoIndex.value == 0
                            ? MingCute.user_4_fill
                            : MingCute.user_4_line),
                        const SizedBox(width: 5),
                        const BaseText(text: 'Personal Info'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(controller.tabInfoIndex.value == 1
                            ? MingCute.briefcase_fill
                            : MingCute.briefcase_line),
                        const SizedBox(width: 5),
                        const BaseText(text: 'Employee Info'),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseText(
                              text: 'Email',
                              size: 12,
                              color: Colors.grey.shade600,
                            ),
                            controller.profile.value == null
                                ? BaseShimmer(
                                    child: Container(
                                      height: 16,
                                      width: 180,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  )
                                : BaseText(
                                    text: controller.profile.value?.email ?? '',
                                    bold: FontWeight.w500,
                                  ),
                            const SizedBox(height: 5),
                            BaseText(
                              text: 'Gender',
                              size: 12,
                              color: Colors.grey.shade600,
                            ),
                            controller.profile.value == null
                                ? BaseShimmer(
                                    child: Container(
                                      height: 16,
                                      width: 80,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  )
                                : BaseText(
                                    text: controller.profile.value?.gender
                                            .toString()
                                            .capitalize ??
                                        '',
                                    bold: FontWeight.w500,
                                  ),
                            const SizedBox(height: 5),
                            BaseText(
                              text: 'Phone Number',
                              size: 12,
                              color: Colors.grey.shade600,
                            ),
                            controller.profile.value == null
                                ? BaseShimmer(
                                    child: Container(
                                      height: 16,
                                      width: 95,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  )
                                : BaseText(
                                    text:
                                        controller.profile.value?.noTelp ?? '',
                                    bold: FontWeight.w500,
                                  ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseText(
                              text: 'Employee ID',
                              size: 12,
                              color: Colors.grey.shade600,
                            ),
                            controller.profile.value == null
                                ? BaseShimmer(
                                    child: Container(
                                      height: 16,
                                      width: 85,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  )
                                : BaseText(
                                    text: controller.profile.value
                                            ?.nomorIndukKaryawan ??
                                        '',
                                    bold: FontWeight.w500,
                                  ),
                            const SizedBox(height: 5),
                            BaseText(
                              text: 'Role',
                              size: 12,
                              color: Colors.grey.shade600,
                            ),
                            controller.profile.value == null
                                ? BaseShimmer(
                                    child: Container(
                                      height: 16,
                                      width: 120,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  )
                                : BaseText(
                                    text: controller
                                            .profile.value?.jabatan?.nama ??
                                        '',
                                    bold: FontWeight.w500,
                                  ),
                            const SizedBox(height: 5),
                            BaseText(
                              text: 'Branch Name',
                              size: 12,
                              color: Colors.grey.shade600,
                            ),
                            controller.profile.value == null
                                ? BaseShimmer(
                                    child: Container(
                                      height: 16,
                                      width: 120,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    ),
                                  )
                                : BaseText(
                                    text: controller
                                            .profile.value?.cabang?.nama ??
                                        '',
                                    bold: FontWeight.w500,
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 5),
                  child: BaseTextButton(
                    text: 'View More',
                    size: 12,
                    color: Colors.grey.shade600,
                    onPressed: () {
                      if (controller.tabInfoIndex.value == 0) {
                        Get.toNamed(
                          '/personalInfo',
                          arguments: {
                            'profile': controller.profile.value,
                          },
                        );
                      } else {
                        Get.toNamed(
                          '/employeeInfo',
                          arguments: {
                            'profile': controller.profile.value,
                          },
                        );
                      }
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
