import 'package:dailyateam/app/components/base_button.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/data/models/approves/req_overtime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget reqOvertimeBottomSheet({
  required ReqOvertime reqOvertime,
  Function()? onApprove,
  Function()? onReject,
}) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: BaseText(
            text: reqOvertime.getkar?.namaLengkap ?? '',
            size: 18,
            bold: FontWeight.bold,
          ),
        ),
        Center(
          child: BaseText(
            text: reqOvertime.getkar?.cabang?.nama ?? '',
            size: 16,
            bold: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BaseText(
                    text: 'Request for',
                    bold: FontWeight.w600,
                  ),
                  BaseText(
                    text: AppHelpers.dateFormat(
                      reqOvertime.tanggalOvertime ?? DateTime(0000),
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
                      reqOvertime.createdAt ?? DateTime(0000),
                    ),
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: SizedBox(
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text: 'Duration :',
                    size: 12,
                    color: Colors.grey.shade600,
                  ),
                  BaseText(
                    text: reqOvertime.durasi ?? '',
                    bold: FontWeight.w500,
                  ),
                  const SizedBox(height: 10),
                  BaseText(
                    text: 'Compensation :',
                    size: 12,
                    color: Colors.grey.shade600,
                  ),
                  BaseText(
                    text: reqOvertime.kompensasi ?? '',
                    bold: FontWeight.w500,
                  ),
                  const SizedBox(height: 10),
                  BaseText(
                    text: 'Notes :',
                    size: 12,
                    color: Colors.grey.shade600,
                  ),
                  BaseText(
                    text: reqOvertime.note ?? '',
                    bold: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ),
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
  );
}
