import 'package:dailyateam/app/components/base_nodata.dart';
import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/data/models/log_attendance.dart';
import 'package:dailyateam/app/modules/log_attendance/components/logattendance_card.dart';
import 'package:dailyateam/app/modules/log_attendance/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class LogAttendanceList extends StatelessWidget {
  LogAttendanceList({super.key});
  final controller = Get.find<LogAttendanceController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: controller.isLoading.value
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(15),
                itemCount: 25,
                itemBuilder: (context, index) {
                  return BaseShimmer(
                    child: LogAttendanceCard(
                      imageMasuk: '',
                      jamMasuk: DateTime(0000),
                      tanggal: DateTime(0000),
                      status: '',
                      imagePulang: '',
                      jamPulang: DateTime(0000),
                    ),
                  );
                },
              )
            : controller.attendance.value?.presensi == null
                ? BaseNoData(
                    image: 'attendance.svg',
                    title: 'Log Attendance Empty',
                    subtitle: 'Your log attendance is empty',
                    onPressed: () {
                      controller.logAttendance.clear();
                      controller.attendance.value = null;
                      controller.isLoading.value = true;
                      controller.fetchLogAttendance();
                    },
                  )
                : RefreshIndicator(
                    onRefresh: controller.refreshLogAttendance,
                    child: GroupedListView(
                      order: GroupedListOrder.DESC,
                      physics: const AlwaysScrollableScrollPhysics(),
                      elements:
                          controller.attendance.value?.presensi ?? <Presensi>[],
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                      groupBy: (element) => DateFormat('MMMM')
                          .format(element.tanggal ?? DateTime(0000)),
                      groupComparator: (value1, value2) =>
                          value1.compareTo(value1),
                      itemComparator: (item1, item2) =>
                          item1.tanggal
                              ?.compareTo(item2.tanggal ?? DateTime(0000)) ??
                          0,
                      groupSeparatorBuilder: (element) => BaseText(
                        text: element,
                        bold: FontWeight.w600,
                        color: navyColor,
                      ),
                      itemBuilder: (context, element) {
                        return LogAttendanceCard(
                          imageMasuk: element.imageMasuk ?? '',
                          jamMasuk: element.jamMasuk ?? DateTime(0000),
                          tanggal: element.tanggal ?? DateTime(0000),
                          status: element.presensiStatus ?? '',
                          imagePulang: element.imagePulang ?? '',
                          jamPulang: element.jamPulang ?? DateTime(0000),
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}
