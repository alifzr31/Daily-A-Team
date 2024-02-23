import 'package:dailyateam/app/components/base_nodata.dart';
import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/modules/schedule/components/schedule_card.dart';
import 'package:dailyateam/app/modules/schedule/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScheduleBody extends StatelessWidget {
  ScheduleBody({super.key});
  final controller = Get.find<ScheduleController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(15),
              itemCount: 25,
              itemBuilder: (context, index) {
                return const BaseShimmer(
                  child: ScheduleCard(
                    jenisShift: '',
                    month: '',
                    day: '',
                    dayName: '',
                    clockIn: '',
                    clockOut: '',
                    difference: '',
                  ),
                );
              },
            )
          : controller.schedule.isEmpty
              ? BaseNoData(
                  image: 'schedule.svg',
                  title: 'Schedule Empty',
                  subtitle: 'Schedule is empty',
                  onPressed: () {
                    controller.isLoading.value = true;
                    controller.schedule.clear();
                    controller.fetchSchedule();
                  },
                )
              : RefreshIndicator(
                  onRefresh: controller.refreshSchedule,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: controller.schedule.length,
                    itemBuilder: (context, index) {
                      final schedule = controller.schedule[index];
                      final month = DateFormat('MMM')
                          .format(schedule.tanggal ?? DateTime(0000));
                      final day = DateFormat('dd')
                          .format(schedule.tanggal ?? DateTime(0000));
                      final dayName = DateFormat('E,')
                          .format(schedule.tanggal ?? DateTime(0000));
                      final clockIn = DateFormat.Hms()
                          .parse(schedule.parampresensi?.jamMasuk ?? '');
                      final clockOut = DateFormat.Hms()
                          .parse(schedule.parampresensi?.jamPulang ?? '');
                      final difference = clockOut.difference(clockIn).inHours;

                      return ScheduleCard(
                        jenisShift: schedule.parampresensi?.jenisShift ?? '',
                        month: month,
                        day: day,
                        dayName: dayName,
                        clockIn: schedule.parampresensi?.jamMasuk ?? '',
                        clockOut: schedule.parampresensi?.jamPulang ?? '',
                        difference: difference.toString(),
                        onPressed: () => Get.toNamed(
                          '/changeShift',
                          arguments: {
                            'date': schedule.tanggal,
                            'fromShift': schedule.parampresensi?.jenisShift,
                          },
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
