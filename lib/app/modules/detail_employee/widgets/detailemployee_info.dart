import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/modules/detail_employee/components/detail_item.dart';
import 'package:dailyateam/app/modules/detail_employee/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class DetailEmployeeInfo extends StatelessWidget {
  DetailEmployeeInfo({super.key});
  final controller = Get.find<DetailEmployeeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: 2,
        child: Expanded(
          child: Container(
            width: Get.width,
            padding: const EdgeInsets.all(15),
            child: Material(
              color: Colors.white,
              elevation: 1,
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  TabBar(
                    labelPadding: const EdgeInsets.symmetric(vertical: 5),
                    onTap: (index) => controller.currentTab.value = index,
                    tabs: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(controller.currentTab.value == 0
                              ? MingCute.user_4_fill
                              : MingCute.user_4_line),
                          const SizedBox(width: 5),
                          const BaseText(text: 'Personal Info'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(controller.currentTab.value == 1
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
                        SingleChildScrollView(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              DetailItem(
                                title: 'Gender',
                                value: controller.employee.value?.gender ?? '',
                              ),
                              DetailItem(
                                title: 'Place of Birth',
                                value: controller.employee.value?.tempatLahir ??
                                    '',
                              ),
                              DetailItem(
                                title: 'Date of Birth',
                                value: AppHelpers.dateFormat(
                                    controller.employee.value?.tglLahir ??
                                        DateTime(0000)),
                              ),
                              DetailItem(
                                title: 'Religion',
                                value: controller.employee.value?.agama ?? '',
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              const DetailItem(
                                title: 'Organization',
                                value: '-',
                              ),
                              DetailItem(
                                title: 'Branch Name',
                                value:
                                    controller.employee.value?.cabang?.nama ??
                                        '',
                              ),
                              const DetailItem(
                                title: 'Company Name',
                                value: 'PT Anyar Retail',
                              ),
                              DetailItem(
                                title: 'Employee Type',
                                value:
                                    controller.employee.value?.statusKaryawan ??
                                        '',
                              ),
                              DetailItem(
                                title: 'Join Date',
                                value: AppHelpers.dateFormat(
                                    controller.employee.value?.tahunGabung ??
                                        DateTime(0000)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
