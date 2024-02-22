import 'package:dailyateam/app/components/base_appbar.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/requests/overtime/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class OvertimeAppbar extends StatelessWidget implements PreferredSizeWidget {
  OvertimeAppbar({super.key});
  final controller = Get.find<OvertimeController>();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 50);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BaseAppBar(
        bgColor: Colors.white,
        fgColor: navyColor,
        withBorderRadius: true,
        title: 'Overtime',
        bottom: TabBar(
          labelPadding: const EdgeInsets.symmetric(vertical: 8),
          onTap: (index) => controller.currentTab.value = index,
          tabs: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(controller.currentTab.value == 0
                    ? MingCute.paper_fill
                    : MingCute.paper_line),
                const SizedBox(width: 5),
                const BaseText(text: 'Form Request'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(controller.currentTab.value == 1
                    ? MingCute.list_check_3_fill
                    : MingCute.list_check_3_line),
                const SizedBox(width: 5),
                const BaseText(text: 'Log Request'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
