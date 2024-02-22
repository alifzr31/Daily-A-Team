import 'package:dailyateam/app/components/base_button.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/data/models/approves/req_changeshift.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget reqChangeShiftBottomSheet({
  required ReqChangeShift reqChangeShift,
  Function()? onApprove,
  Function()? onReject,
}) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Column(
      children: [
        BaseText(
          text: reqChangeShift.namaLengkap ?? '',
          size: 18,
          bold: FontWeight.bold,
        ),
        const SizedBox(height: 5),
        BaseText(
          text: reqChangeShift.nomorIndukKaryawan ?? '',
          size: 16,
          bold: FontWeight.bold,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text:
                        'Request ${reqChangeShift.shiftAwal} to ${reqChangeShift.shiftAkhir}',
                    bold: FontWeight.w600,
                  ),
                  BaseText(
                    text: AppHelpers.dateFormat(
                        reqChangeShift.tanggalAwal ?? DateTime(0000)),
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
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
                        reqChangeShift.createdAt ?? DateTime(0000)),
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
                text: reqChangeShift.keterangan ?? '',
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
