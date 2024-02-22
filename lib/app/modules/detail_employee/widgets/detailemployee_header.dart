import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/detail_employee/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailEmployeeHeader extends StatelessWidget {
  DetailEmployeeHeader({super.key});
  final controller = Get.find<DetailEmployeeController>();

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
                CircleAvatar(
                  radius: 40,
                  backgroundColor: softBlue,
                  foregroundColor: navyColor,
                  backgroundImage: controller.employee.value?.photo == null ||
                          controller.employee.value?.photo == '0' ||
                          controller.employee.value?.photo == ''
                      ? null
                      : Image.network(
                          '${ApiUrl.storageUrl}/${controller.employee.value?.photo}',
                          loadingBuilder: (context, child, loadingProgress) {
                            return loadingProgress == null
                                ? child
                                : const Center(
                                    child: CupertinoActivityIndicator(
                                      color: navyColor,
                                    ),
                                  );
                          },
                        ).image,
                  child: controller.employee.value?.photo == null ||
                          controller.employee.value?.photo == '0' ||
                          controller.employee.value?.photo == ''
                      ? BaseText(
                          text: AppHelpers.avatarName(
                              controller.employee.value?.namaLengkap ?? ''),
                          size: 26,
                          bold: FontWeight.w600,
                          textAlign: TextAlign.center,
                        )
                      : null,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: controller.employee.value?.namaLengkap ?? '',
                        size: 16,
                        bold: FontWeight.w600,
                      ),
                      BaseText(
                        text: controller.employee.value?.jabatan?.nama ?? '',
                        bold: FontWeight.w500,
                      ),
                      const SizedBox(height: 5),
                      BaseText(
                        text:
                            controller.employee.value?.nomorIndukKaryawan ?? '',
                        color: Colors.grey.shade600,
                      ),
                    ],
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
