import 'package:dailyateam/app/components/base_dropdown.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/profile/payroll_info/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayrollInfoHeader extends StatelessWidget {
  PayrollInfoHeader({super.key});
  final controller = Get.find<PayrollInfoController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Material(
        color: Colors.white,
        elevation: 1,
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Material(
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  elevation: 1,
                  borderRadius: BorderRadius.circular(10),
                  child: BaseDropdown(
                    hint: 'Pick Date',
                    value: controller.selectedPeriod.value,
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    items: controller.period
                        .map((element) => DropdownMenuItem(
                              value: element,
                              child: BaseText(text: element),
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.selectedPeriod.value = value.toString();
                    },
                  )),
              const SizedBox(height: 15),
              Card(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: softBlue,
                        backgroundImage: controller.photo.value == null ||
                                controller.photo.value == '0' ||
                                controller.photo.value == ''
                            ? null
                            : Image.network(
                                '${ApiUrl.storageUrl}/${controller.photo.value}',
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
                        foregroundColor: navyColor,
                        child: controller.photo.value == null ||
                                controller.photo.value == '0' ||
                                controller.photo.value == ''
                            ? BaseText(
                                text: AppHelpers.avatarName(
                                    controller.name.value ?? ''),
                                size: 26,
                                bold: FontWeight.w600,
                                textAlign: TextAlign.center,
                              )
                            : null,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseText(
                              text: controller.name.value ?? '',
                              bold: FontWeight.w600,
                              maxLines: 2,
                            ),
                            BaseText(
                              text: controller.jabatan.value ?? '',
                              size: 12,
                              color: Colors.grey.shade600,
                              bold: FontWeight.w500,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
