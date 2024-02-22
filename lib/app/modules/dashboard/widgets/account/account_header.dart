import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/components/base_textbutton.dart';
import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/core/values/show_custombottomsheet.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';

class AccountHeader extends StatelessWidget {
  AccountHeader({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 130,
        width: Get.width,
        child: Material(
          color: Colors.white,
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.profile.value == null
                          ? BaseShimmer(
                              child: Container(
                                height: 18,
                                width: 150,
                                margin: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            )
                          : BaseText(
                              text: controller.profile.value?.namaLengkap ?? '',
                              size: 16,
                              bold: FontWeight.w600,
                            ),
                      const SizedBox(height: 5),
                      controller.profile.value == null
                          ? BaseShimmer(
                              child: Container(
                                height: 14,
                                width: 125,
                                margin: const EdgeInsets.only(bottom: 3),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            )
                          : BaseText(
                              text:
                                  controller.profile.value?.jabatan?.nama ?? '',
                              size: 12,
                            ),
                      controller.profile.value == null
                          ? BaseShimmer(
                              child: Container(
                                height: 14,
                                width: 120,
                                margin: const EdgeInsets.only(bottom: 3),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            )
                          : BaseText(
                              text:
                                  controller.profile.value?.cabang?.nama ?? '',
                              size: 12,
                            ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                            backgroundImage: controller.profile.value?.photo ==
                                        null ||
                                    controller.profile.value?.photo == '0' ||
                                    controller.profile.value?.photo == ''
                                ? null
                                : Image.network(
                                    '${ApiUrl.storageUrl}/${controller.profile.value?.photo}',
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      return loadingProgress == null
                                          ? child
                                          : const Center(
                                              child: CupertinoActivityIndicator(
                                                color: navyColor,
                                              ),
                                            );
                                    },
                                  ).image,
                            child: controller.profile.value?.photo == null ||
                                    controller.profile.value?.photo == '0' ||
                                    controller.profile.value?.photo == ''
                                ? BaseText(
                                    text: AppHelpers.avatarName(
                                        controller.profile.value?.namaLengkap ??
                                            ''),
                                    size: 26,
                                    bold: FontWeight.w600,
                                    textAlign: TextAlign.center,
                                  )
                                : null,
                          ),
                    const SizedBox(height: 5),
                    BaseTextButton(
                      size: 12,
                      color: navyColor,
                      text: 'Change Photo',
                      onPressed: () {
                        showCustomBottomSheet(
                          height: 160,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                const BaseText(
                                  text: 'Change Photo',
                                  size: 16,
                                  bold: FontWeight.w600,
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        softBlue),
                                                foregroundColor:
                                                    MaterialStatePropertyAll(
                                                        navyColor)),
                                            iconSize: 30,
                                            color: navyColor,
                                            onPressed: () =>
                                                controller.changePhotoProfile(
                                              ImageSource.camera,
                                            ),
                                            icon: const Icon(
                                                MingCute.camera_line),
                                          ),
                                          BaseText(
                                            text: 'From Camera',
                                            color: Colors.grey.shade600,
                                            bold: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 60),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        softBlue),
                                                foregroundColor:
                                                    MaterialStatePropertyAll(
                                                        navyColor)),
                                            iconSize: 30,
                                            color: navyColor,
                                            onPressed: () =>
                                                controller.changePhotoProfile(
                                              ImageSource.gallery,
                                            ),
                                            icon: const Icon(
                                                MingCute.folder_open_line),
                                          ),
                                          BaseText(
                                            text: 'From Document',
                                            color: Colors.grey.shade600,
                                            bold: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
