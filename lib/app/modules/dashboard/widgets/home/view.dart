import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/home/home_announcement.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/home/home_breaktime.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/home/home_header.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/home/home_menu.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/home/home_noclockout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: controller.refreshHome,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            HomeHeader(),
            if (controller.levKar.value != null) HomeMenu(),
            HomeNoClockOut(),
            HomeBreakTime(),
            HomeAnnouncement(),
          ],
        ),
      ),
    );
  }
}
