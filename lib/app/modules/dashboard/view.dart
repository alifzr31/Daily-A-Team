import 'package:dailyateam/app/components/base_button.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/core/values/show_custombottomsheet.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/dashboard_appbar.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/dashboard_body.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/dashboard_bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        showCustomBottomSheet(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: BaseText(
                    text: 'Are You Sure?',
                    size: 16,
                    bold: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Column(
                    children: [
                      const Expanded(
                        child: BaseText(
                          text:
                              'Are you sure want to exit and close Daly A-Team?',
                        ),
                      ),
                      SizedBox(
                        width: Get.width,
                        child: BaseButton(
                          bgColor: navyColor,
                          fgColor: Colors.white,
                          label: 'Ya, Tutup Aplikasi',
                          onPressed: () {
                            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: DashboardAppBar(),
        body: DashboardBody(),
        bottomNavigationBar: DashboardBottomNav(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 1,
          backgroundColor: navyColor,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          onPressed: () => Get.toNamed('/camera'),
          child: const Icon(
            MingCute.camera_2_line,
            size: 25,
          ),
        ),
      ),
    );
  }
}
