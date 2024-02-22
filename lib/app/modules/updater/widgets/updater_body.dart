import 'package:dailyateam/app/components/base_button.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/updater/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class UpdaterBody extends StatelessWidget {
  UpdaterBody({super.key});
  final controller = Get.find<UpdaterController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lotties/update.json',
                    width: 250,
                    frameRate: FrameRate(240),
                  ),
                  const SizedBox(height: 40),
                  const BaseText(
                    text: 'Update Available!',
                    textAlign: TextAlign.center,
                    size: 18,
                    bold: FontWeight.w600,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseText(
                        text: controller.currentVersion.value ?? '',
                        size: 12,
                        color: Colors.grey.shade600,
                        bold: FontWeight.w500,
                      ),
                      const BaseText(
                        text: ' to ',
                        size: 12,
                      ),
                      BaseText(
                        text: controller.storeVersion.value ?? '',
                        size: 12,
                        color: Colors.green,
                        bold: FontWeight.w600,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  BaseText(
                    text:
                        'Make your day more awesome with new version of Daily A-Team. Update now to get your happiness.',
                    textAlign: TextAlign.center,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: Get.width,
              child: BaseButton(
                bgColor: navyColor,
                fgColor: Colors.white,
                label: 'Update Now',
                onPressed: controller.updateNow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
