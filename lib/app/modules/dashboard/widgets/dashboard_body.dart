import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/account/view.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/employee/view.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/home/view.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/inbox/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardBody extends StatelessWidget {
  DashboardBody({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: controller.currentPage.value,
        children: [
          HomePage(),
          const EmployeePage(),
          const InboxPage(),
          const AccountPage(),
        ],
      ),
    );
  }
}
