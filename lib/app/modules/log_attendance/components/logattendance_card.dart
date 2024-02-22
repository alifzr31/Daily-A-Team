import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';

class LogAttendanceCard extends StatelessWidget {
  const LogAttendanceCard({
    Key? key,
    required this.imageMasuk,
    required this.jamMasuk,
    required this.tanggal,
    required this.status,
    required this.imagePulang,
    required this.jamPulang,
  }) : super(key: key);

  final String imageMasuk;
  final DateTime jamMasuk;
  final DateTime tanggal;
  final String status;
  final String imagePulang;
  final DateTime jamPulang;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));

    return Card(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Column(
              children: [
                const BaseText(text: 'Clock In'),
                const SizedBox(height: 5),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: softBlue,
                  backgroundImage: imageMasuk != ''
                      ? Image.network(
                          '${ApiUrl.storageUrl}/presensi/$imageMasuk',
                          loadingBuilder: (context, child, loadingProgress) {
                            return loadingProgress == null
                                ? child
                                : const Center(
                                    child: CupertinoActivityIndicator(
                                      color: navyColor,
                                    ),
                                  );
                          },
                        ).image
                      : null,
                  child: imageMasuk != ''
                      ? null
                      : const Icon(
                          MingCute.user_3_fill,
                          size: 30,
                          color: navyColor,
                        ),
                ),
                const SizedBox(height: 5),
                if (jamMasuk != DateTime(0000))
                  BaseText(
                    text: DateFormat('HH:mm').format(jamMasuk),
                    bold: FontWeight.w500,
                    color: status == 'LateIn' ? Colors.red : null,
                  ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                children: [
                  BaseText(
                    text: AppHelpers.dayDateFormat(tanggal),
                    size: 12,
                    bold: FontWeight.w500,
                    color: Colors.grey.shade600,
                    textAlign: TextAlign.center,
                  ),
                  if (status != 'EarlyIn' &&
                      status != 'OnTime' &&
                      // status != 'Alpa' &&
                      status != '')
                    BaseText(
                      text: status.capitalize ?? '',
                      bold: FontWeight.w600,
                      color: Colors.red,
                      textAlign: TextAlign.center,
                    ),
                  if (jamMasuk != DateTime(0000) &&
                      jamPulang == DateTime(0000) &&
                      tanggal != now)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: BaseText(
                        text: 'No Clock Out',
                        bold: FontWeight.w600,
                        color: Colors.amber[600],
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
            Column(
              children: [
                const BaseText(text: 'Clock Out'),
                const SizedBox(height: 5),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: softBlue,
                  backgroundImage: imagePulang != ''
                      ? Image.network(
                          '${ApiUrl.storageUrl}/presensi/$imagePulang',
                          loadingBuilder: (context, child, loadingProgress) {
                            return loadingProgress == null
                                ? child
                                : const Center(
                                    child: CupertinoActivityIndicator(
                                      color: navyColor,
                                    ),
                                  );
                          },
                        ).image
                      : null,
                  child: imagePulang != ''
                      ? null
                      : const Icon(
                          MingCute.user_3_fill,
                          size: 30,
                          color: navyColor,
                        ),
                ),
                const SizedBox(height: 5),
                if (jamMasuk != DateTime(0000))
                  BaseText(
                    text: jamPulang == DateTime(0000)
                        ? '-'
                        : DateFormat('HH:mm').format(jamPulang),
                    bold: FontWeight.w500,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
