import 'package:dailyateam/app/components/base_appbar.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  DashboardAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(0);
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseAppBar(
        bgColor: controller.currentPage.value == 0 ? navyColor : Colors.white,
        title: '',
      ),
    );
  }
}
