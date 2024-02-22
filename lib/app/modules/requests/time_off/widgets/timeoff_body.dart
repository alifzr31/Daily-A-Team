import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/modules/requests/time_off/controller.dart';
import 'package:dailyateam/app/modules/requests/time_off/widgets/timeoff_form.dart';
import 'package:dailyateam/app/modules/requests/time_off/widgets/timeoff_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class TimeOffBody extends StatelessWidget {
  TimeOffBody({super.key});
  final controller = Get.find<TimeOffController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: 2,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Material(
              color: Colors.white,
              elevation: 1,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  TabBar(
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
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        TimeOffForm(),
                        TimeOffLog(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
