import 'package:dailyateam/app/components/base_button.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/data/models/approves/req_timeoff.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget reqTimeOffBottomSheet({
  required ReqTimeOff reqTimeOff,
  Function()? onApprove,
  Function()? onReject,
}) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Column(
      children: [
        BaseText(
          text: reqTimeOff.namaLengkap ?? '',
          size: 18,
          bold: FontWeight.w600,
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text: 'Request ${reqTimeOff.statusoff}',
                    bold: FontWeight.w600,
                  ),
                  BaseText(
                    text: AppHelpers.dateFormat(
                      reqTimeOff.tanggal ?? DateTime(0000),
                    ),
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const BaseText(
                    text: 'Created at',
                    bold: FontWeight.w600,
                  ),
                  BaseText(
                    text: AppHelpers.dateTimeFormat(
                      reqTimeOff.createdAt ?? DateTime(0000),
                    ),
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
          ],
        ),
        if (reqTimeOff.dokumen != null) const SizedBox(height: 10),
        if (reqTimeOff.notesAju != null)
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                BaseText(
                  text: 'Notes :',
                  size: 12,
                  color: Colors.grey.shade600,
                ),
                BaseText(text: reqTimeOff.notesAju ?? ''),
              ],
            ),
          ),
        if (reqTimeOff.dokumen != null)
          Expanded(
            child: InkWell(
              onTap: () {
                Get.dialog(
                  Center(
                    child: Container(
                      height: Get.height * 0.8,
                      width: Get.width * 0.8,
                      padding: const EdgeInsets.all(15),
                      child: Image.network(
                        '${ApiUrl.storageUrl}${EndPointStorage.timeOff}/${reqTimeOff.dokumen}',
                        loadingBuilder: (context, child, loadingProgress) {
                          return loadingProgress == null
                              ? child
                              : const Center(
                                  child: CupertinoActivityIndicator(
                                    color: Colors.white,
                                  ),
                                );
                        },
                      ),
                    ),
                  ),
                );
              },
              child: Image.network(
                '${ApiUrl.storageUrl}${EndPointStorage.timeOff}/${reqTimeOff.dokumen}',
                loadingBuilder: (context, child, loadingProgress) {
                  return loadingProgress == null
                      ? child
                      : const Center(
                          child: CupertinoActivityIndicator(
                            color: Colors.white,
                          ),
                        );
                },
              ),
            ),
          ),
        const SizedBox(height: 10),
        reqTimeOff.dokumen == null
            ? Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: Get.width,
                      child: BaseButton(
                        bgColor: navyColor,
                        fgColor: Colors.white,
                        label: 'Approve',
                        onPressed: onApprove,
                      ),
                    ),
                    SizedBox(
                      width: Get.width,
                      child: BaseButton(
                        bgColor: Colors.red,
                        fgColor: Colors.white,
                        label: 'Reject',
                        onPressed: onReject,
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: Get.width,
                    child: BaseButton(
                      bgColor: navyColor,
                      fgColor: Colors.white,
                      label: 'Approve',
                      onPressed: onApprove,
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    child: BaseButton(
                      bgColor: Colors.red,
                      fgColor: Colors.white,
                      label: 'Reject',
                      onPressed: onReject,
                    ),
                  ),
                ],
              ),
      ],
    ),
  );
}
