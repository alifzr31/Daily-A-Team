import 'package:dailyateam/app/components/base_nodata.dart';
import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/modules/break_time/components/breaktime_card.dart';
import 'package:dailyateam/app/modules/break_time/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BreakTimeBody extends StatelessWidget {
  BreakTimeBody({super.key});
  final controller = Get.find<BreakTimeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(15),
              itemCount: 25,
              itemBuilder: (context, index) {
                return BaseShimmer(
                  child: BreakTimeCard(
                    breakOut: '',
                    date: DateTime(0000),
                    breakIn: '',
                    index: index,
                    dataLength: 25,
                  ),
                );
              },
            )
          : controller.breakTime.isEmpty
              ? BaseNoData(
                  image: 'breaktime.svg',
                  title: 'Break Time Empty',
                  subtitle: 'Your log breaktime is empty',
                  onPressed: () {
                    controller.isLoading.value = true;
                    controller.breakTime.clear();
                    controller.fetchBreakTime();
                  },
                )
              : RefreshIndicator(
                  onRefresh: controller.refreshBreakTime,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: controller.breakTime.length,
                    itemBuilder: (context, index) {
                      final breakTime = controller.breakTime[index];

                      return BreakTimeCard(
                        breakOut: breakTime.istirahatKeluar ?? '00:00:00',
                        date: breakTime.tanggal ?? DateTime(0000),
                        breakIn: breakTime.istirahatMasuk ?? '00:00:00',
                        index: index,
                        dataLength: controller.breakTime.length,
                      );
                    },
                  ),
                ),
    );
  }
}
