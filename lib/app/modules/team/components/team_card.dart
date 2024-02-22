import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/components/base_textbutton.dart';
import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({
    super.key,
    required this.photo,
    required this.name,
    required this.jabatan,
    required this.employeeID,
    required this.presensiStatus,
    required this.reason,
    this.jamMasuk,
    this.jamPulang,
    this.selectedStatus,
    this.index,
    this.dataLength,
  });

  final String photo;
  final String name;
  final String jabatan;
  final String employeeID;
  final String presensiStatus;
  final String reason;
  final String? jamMasuk;
  final String? jamPulang;
  final String? selectedStatus;
  final int? index;
  final int? dataLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: index == (dataLength! - 1) ? 0 : 10,
      ),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(10),
        child: ExpandedTile(
          contentseparator: 0,
          theme: const ExpandedTileThemeData(
            contentRadius: 0,
            headerRadius: 0,
            headerPadding: EdgeInsets.all(15),
            contentPadding: EdgeInsets.fromLTRB(26, 0, 26, 15),
            headerColor: Colors.white,
            contentBackgroundColor: Colors.white,
          ),
          leading: CircleAvatar(
            radius: 35,
            backgroundColor: softBlue,
            foregroundColor: navyColor,
            backgroundImage: photo == '0' || photo == ''
                ? null
                : Image.network(
                    '${ApiUrl.storageUrl}/$photo',
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
            child: photo == '0' || photo == ''
                ? BaseText(
                    text: AppHelpers.avatarName(name),
                    size: 26,
                    bold: FontWeight.w600,
                    textAlign: TextAlign.center,
                  )
                : null,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText(
                text: name,
                size: 14,
                bold: FontWeight.w500,
              ),
              BaseText(
                text: jabatan,
                size: 12,
                color: Colors.grey.shade600,
              )
            ],
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                height: 0,
                color: Colors.grey.shade300,
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: presensiStatus == 'EarlyIn' ||
                            presensiStatus == 'Late' ||
                            presensiStatus == 'OnTime'
                        ? 0
                        : 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseText(
                          text: 'Employee ID',
                          size: 12,
                          color: Colors.grey.shade600,
                        ),
                        BaseText(
                          text: employeeID,
                          bold: FontWeight.w500,
                        ),
                        const SizedBox(height: 10),
                        BaseText(
                          text: 'Attendance Status',
                          size: 12,
                          color: Colors.grey.shade600,
                        ),
                        BaseText(
                          text: presensiStatus == ''
                              ? '-'
                              : presensiStatus != 'EarlyIn' &&
                                      presensiStatus != 'OnTime' &&
                                      presensiStatus != 'Late'
                                  ? presensiStatus
                                  : jamMasuk == null && jamPulang == null
                                      ? '$presensiStatus (00:00:00 - 00:00:00)'
                                      : jamMasuk != null && jamPulang == null
                                          ? '$presensiStatus ($jamMasuk - 00:00:00)'
                                          : '$presensiStatus ($jamMasuk - $jamPulang)',
                          bold: FontWeight.w500,
                          color: presensiStatus == 'Late' ? Colors.red : null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: presensiStatus == 'EarlyIn' ||
                            presensiStatus == 'Late' ||
                            presensiStatus == 'OnTime' ||
                            presensiStatus == '-'
                        ? 0
                        : 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (selectedStatus == 'sakit')
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              BaseText(
                                text: 'File',
                                size: 12,
                                color: Colors.grey.shade600,
                              ),
                              BaseTextButton(
                                text: 'View Document',
                                size: 14,
                                color: navyColor,
                                onPressed: () {},
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        BaseText(
                          text: 'Reason',
                          size: 12,
                          color: Colors.grey.shade600,
                        ),
                        BaseText(
                          text: reason,
                          textAlign: TextAlign.end,
                          bold: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          controller: ExpandedTileController(),
        ),
      ),
    );
  }
}
