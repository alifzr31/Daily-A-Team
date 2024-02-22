import 'package:dailyateam/app/components/base_button.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/data/models/approves/req_attendance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget reqAttendanceBottomSheet({
  required ReqAttendance reqAttendance,
  Function()? onApprove,
  Function()? onReject,
}) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Column(
      children: [
        BaseText(
          text: reqAttendance.namaLengkap ?? '',
          size: 18,
          bold: FontWeight.w600,
        ),
        BaseText(
          text: reqAttendance.nomorIndukKaryawan ?? '',
          size: 16,
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
                    text: 'Request ${reqAttendance.jenis}',
                    bold: FontWeight.w600,
                  ),
                  BaseText(
                    text: AppHelpers.dateFormat(
                        reqAttendance.tanggal ?? DateTime(0000)),
                    color: Colors.grey.shade600,
                  ),
                  BaseText(
                    text: '(${reqAttendance.jam})',
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
                    bold: FontWeight.w500,
                  ),
                  BaseText(
                    text: AppHelpers.dateTimeFormat(
                      reqAttendance.createdAt ?? DateTime(0000),
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: BaseText(
                text: reqAttendance.notes ?? '',
                textAlign: TextAlign.justify,
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
