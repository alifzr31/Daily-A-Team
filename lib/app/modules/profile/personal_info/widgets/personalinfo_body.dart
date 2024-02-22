import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/modules/profile/components/info_item.dart';
import 'package:dailyateam/app/modules/profile/personal_info/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoBody extends StatelessWidget {
  PersonalInfoBody({super.key});
  final controller = Get.find<PersonalInfoController>();

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
                  title: 'Full Name',
                  value: controller.profile.value?.namaLengkap ?? '',
                ),
                InfoItem(
                  title: 'Email',
                  value: controller.profile.value?.email ?? '',
                ),
                InfoItem(
                  title: 'Gender',
                  value:
                      controller.profile.value?.gender.toString().capitalize ??
                          '',
                ),
                InfoItem(
                  title: 'Place of Birth',
                  value: controller.profile.value?.tempatLahir ?? '',
                ),
                InfoItem(
                  title: 'Date of Birth',
                  value: AppHelpers.dateFormat(
                      controller.profile.value?.tglLahir ?? DateTime(0000)),
                ),
                InfoItem(
                  title: 'Phone Number',
                  value: controller.profile.value?.noTelp ?? '',
                ),
                InfoItem(
                  title: 'Marital Status',
                  value: controller.profile.value?.statusPernikahan ?? '',
                ),
                InfoItem(
                  title: 'Religion',
                  value: controller.profile.value?.agama ?? '',
                ),
                const InfoItem(
                  title: 'ID Type',
                  value: 'KTP',
                ),
                InfoItem(
                  title: 'ID Number',
                  value: controller.profile.value?.noIdentitas ?? '',
                ),
                InfoItem(
                  title: 'Citizen ID Address',
                  value: controller.profile.value?.alamat ?? '',
                ),
                InfoItem(
                  title: 'Residential Address',
                  value: controller.profile.value?.alamatDomisili ?? '',
                ),
                InfoItem(
                  title: 'Postal Code',
                  value: controller.profile.value?.kodepos ?? '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
