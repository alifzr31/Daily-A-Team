import 'package:dailyateam/app/components/base_appbar.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/clock_in_out/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ClockInOutAppbar extends StatelessWidget implements PreferredSizeWidget {
  ClockInOutAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final controller = Get.find<ClockInOutController>();

  @override
  Widget build(BuildContext context) {
    return BaseAppBar(
      bgColor: Colors.white,
      fgColor: navyColor,
      title: 'Clock In/Out',
      action: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            tooltip: 'Refresh Location',
            onPressed: () => controller.fetchLocation(),
            icon: SvgPicture.asset(
              'assets/images/refresh_loc.svg',
              width: 28,
            ),
          ),
        ),
      ],
    );
  }
}
