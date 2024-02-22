import 'package:cool_alert/cool_alert.dart';
import 'package:dailyateam/app/components/base_button.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class AccountFooter extends StatelessWidget {
  AccountFooter({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 35),
        child: Column(
          children: [
            SizedBox(
              width: Get.width,
              child: BaseButtonIcon(
                bgColor: Colors.red.shade700,
                fgColor: Colors.white,
                icon: MingCute.power_fill,
                label: 'Log Out',
                onPressed: () {
                  CoolAlert.show(
                    context: context,
                    type: CoolAlertType.confirm,
                    backgroundColor: navyColor,
                    text: 'Are you sure want to logout?',
                    loopAnimation: false,
                    cancelBtnText: 'No',
                    confirmBtnText: 'Yes',
                    confirmBtnColor: navyColor,
                    closeOnConfirmBtnTap: false,
                    onConfirmBtnTap: controller.logout,
                  );
                },
              ),
            ),
            BaseText(
              text: '${controller.appName.value} v${controller.version.value}',
              size: 12,
              color: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
