import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/team/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TeamAppbar extends StatelessWidget implements PreferredSizeWidget {
  TeamAppbar({super.key});
  final controller = Get.find<TeamController>();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 150);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    return Stack(
      children: [
        SizedBox(
          height: kToolbarHeight + 160,
          width: Get.width,
          child: const Material(
            elevation: 1,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
        ),
        CalendarAppBar(
          accent: Colors.white,
          fullCalendar: false,
          white: navyColor,
          selectedDate: controller.selectedDate.value,
          lastDate: DateTime.now(),
          onDateChanged: (DateTime date) async {
            controller.selectedStatus.value = null;
            controller.filteredTeam.clear();
            controller.team.clear();
            controller.selectedDate.value = date;
            controller.selectedDateString.value =
                DateFormat('yyyy-MM-dd').format(date);
            controller.isLoading.value = true;
            controller.fetchTeam();
          },
        ),
        const Positioned(
          top: 55,
          left: 60,
          child: BaseText(
            text: 'Team',
            size: 24,
            color: navyColor,
            bold: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
