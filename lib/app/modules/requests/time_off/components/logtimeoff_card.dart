import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/components/base_textbutton.dart';
import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class LogTimeOffCard extends StatelessWidget {
  const LogTimeOffCard({
    super.key,
    required this.statusOff,
    required this.requestDate,
    required this.reason,
    required this.notes,
    required this.document,
    required this.createdAt,
    required this.statusApprove,
    this.onPressedCancel,
    this.index,
    this.dataLength,
  });

  final String statusOff;
  final DateTime requestDate;
  final String reason;
  final String notes;
  final String document;
  final DateTime createdAt;
  final String statusApprove;
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
              text: statusOff.capitalize ?? '',
              bold: FontWeight.w600,
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
                      if (notes != '')
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            BaseText(
                              text: 'Notes',
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
                      if (document != '')
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            BaseTextButton(
                              text: 'View Document',
                              size: 14,
                              color: navyColor,
                              onPressed: () {
                                Get.dialog(
                                  Center(
                                    child: Container(
                                      height: Get.height * 0.8,
                                      width: Get.width * 0.8,
                                      padding: const EdgeInsets.all(15),
                                      child: Image.network(
                                        '${ApiUrl.storageUrl}${EndPointStorage.timeOff}/$document',
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          return loadingProgress == null
                                              ? child
                                              : const Center(
                                                  child:
                                                      CupertinoActivityIndicator(
                                                    color: Colors.white,
                                                  ),
                                                );
                                        },
                                      ),
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
                const SizedBox(width: 10),
                Column(
                  children: [
                    BaseText(
                      text: 'Status',
                      size: 12,
                      color: Colors.grey.shade600,
                    ),
                    BaseText(
                      text: statusApprove == 'PengajuanOff'
                          ? 'Waiting'
                          : statusApprove.toString().capitalize ?? '',
                      bold: FontWeight.w500,
                    ),
                    const SizedBox(height: 5),
                    Icon(
                      statusApprove == 'PengajuanOff'
                          ? MingCute.time_line
                          : statusApprove == 'approve'
                              ? MingCute.check_circle_line
                              : MingCute.close_circle_line,
                      size: 30,
                      color: statusApprove == 'PengajuanOff'
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
                if (statusApprove == 'PengajuanOff')
                  Material(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(3),
                    clipBehavior: Clip.antiAlias,
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: BaseTextButton(
                        text: 'Cancel',
                        size: 12,
                        color: Colors.white,
                        onPressed: onPressedCancel,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
