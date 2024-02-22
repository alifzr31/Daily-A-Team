import 'package:dailyateam/app/components/base_appbar.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/approve/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ApproveAppbar extends StatelessWidget implements PreferredSizeWidget {
  ApproveAppbar({super.key});
  final controller = Get.find<ApproveController>();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 50);

  @override
  Widget build(BuildContext context) {
    return BaseAppBar(
      bgColor: Colors.white,
      fgColor: navyColor,
      withBorderRadius: true,
      title: 'Approve',
      bottom: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.center,
        labelPadding: const EdgeInsets.all(8),
        tabs: List.generate(
          controller.labels.length,
          (index) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/${controller.icons[index]}',
                width: 18,
              ),
              const SizedBox(width: 5),
              BaseText(text: controller.labels[index]),
            ],
          ),
        ),
      ),
    );
  }
}
