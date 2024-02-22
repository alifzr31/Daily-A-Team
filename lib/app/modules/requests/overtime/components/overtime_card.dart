import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/components/base_textbutton.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class OvertimeCard extends StatelessWidget {
  const OvertimeCard({
    super.key,
    required this.time,
    required this.duration,
    required this.requestDate,
    required this.compensation,
    required this.reason,
    required this.statusApprove,
    required this.createdAt,
    this.onPressedCancel,
    this.index,
    this.dataLength,
  });

  final String time;
  final String duration;
  final DateTime requestDate;
  final String compensation;
  final String reason;
  final String statusApprove;
  final DateTime createdAt;
  final void Function()? onPressedCancel;
  final int? index;
  final int? dataLength;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(
        bottom: index == (dataLength! - 1) ? 0 : 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            BaseText(
              text: time,
              bold: FontWeight.w600,
            ),
            BaseText(
              text: '($duration)',
              size: 12,
              bold: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        text: 'Request Date',
                        size: 12,
                        color: Colors.grey.shade600,
                      ),
                      BaseText(
                        text: AppHelpers.dateFormat(requestDate),
                        bold: FontWeight.w500,
                      ),
                      const SizedBox(height: 10),
                      BaseText(
                        text: 'Compensation',
                        size: 12,
                        color: Colors.grey.shade600,
                      ),
                      BaseText(
                        text: compensation,
                        bold: FontWeight.w500,
                      ),
                      const SizedBox(height: 10),
                      BaseText(
                        text: 'Reason',
                        size: 12,
                        color: Colors.grey.shade600,
                      ),
                      BaseText(
                        text: reason,
                        bold: FontWeight.w500,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    BaseText(
                      text: 'Status',
                      size: 12,
                      color: Colors.grey.shade600,
                    ),
                    BaseText(
                      text: statusApprove == 'Request OverTime'
                          ? 'Waiting'
                          : statusApprove.capitalize ?? '',
                      bold: FontWeight.w500,
                    ),
                    const SizedBox(height: 5),
                    Icon(
                      statusApprove == 'Request OverTime'
                          ? MingCute.time_line
                          : statusApprove == 'approve'
                              ? MingCute.check_circle_line
                              : MingCute.close_circle_line,
                      size: 30,
                      color: statusApprove == 'Request OverTime'
                          ? Colors.grey.shade600
                          : statusApprove == 'approve'
                              ? Colors.green
                              : Colors.red,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(
                  text: 'Created at ${AppHelpers.dateTimeFormat(createdAt)}',
                  size: 12,
                  color: Colors.grey.shade600,
                ),
                if (statusApprove == 'Request OverTime')
                  BaseTextButton(
                    text: 'Cancel',
                    size: 12,
                    color: Colors.red,
                    onPressed: onPressedCancel,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
