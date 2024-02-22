import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/modules/profile/components/info_item.dart';
import 'package:dailyateam/app/modules/profile/employee_info/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeInfoBody extends StatelessWidget {
  EmployeeInfoBody({super.key});
  final controller = Get.find<EmployeeInfoController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.all(15),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              children: [
                InfoItem(
                  title: 'Employee ID',
                  value: controller.profile.value?.nomorIndukKaryawan ?? '',
                ),
                InfoItem(
                  title: 'Finger ID',
                  value: controller.profile.value?.noFinger ?? '-',
                ),
                InfoItem(
                  title: 'Branch Name',
                  value: controller.profile.value?.cabang?.nama ?? '',
                ),
                const InfoItem(
                  title: 'Company Name',
                  value: 'PT Anyar Retail Indonesia',
                ),
                InfoItem(
                  title: 'Employee Status',
                  value: controller.profile.value?.statusKaryawan ?? '',
                ),
                InfoItem(
                  title: 'Join Date',
                  value: AppHelpers.dateFormat(
                      controller.profile.value?.tahunGabung ?? DateTime(0000)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
