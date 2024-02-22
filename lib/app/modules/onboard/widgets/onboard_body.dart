import 'package:dailyateam/app/components/base_button.dart';
import 'package:dailyateam/app/components/base_textbutton.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/onboard/components/onboard_item.dart';
import 'package:dailyateam/app/modules/onboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class OnboardBody extends StatelessWidget {
  OnboardBody({super.key});
  final controller = Get.find<OnboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController.value,
                    onPageChanged: (index) =>
                        controller.currentPage.value = index,
                    itemCount: controller.onboardItem.length,
                    itemBuilder: (context, index) {
                      final item = controller.onboardItem[index];

                      return OnboardItem(
                        title: item.title ?? '',
                        secondTitle: item.secondTitle ?? '',
                        image: item.image,
                        titleContent: item.titleContent,
                        description: item.description,
                      );
                    },
                  ),
                ),
                Container(
                  height: 120,
                  width: Get.width,
                  padding: const EdgeInsets.all(15),
                  child: controller.currentPage.value ==
                          controller.onboardItem.length - 1
                      ? Column(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: Get.width,
                                child: BaseButton(
                                  bgColor: Colors.white,
                                  fgColor: navyColor,
                                  label: "I'm a candidate",
                                  onPressed: controller.candidate,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: SizedBox(
                                width: Get.width,
                                child: BaseButton(
                                  bgColor: Colors.white,
                                  fgColor: navyColor,
                                  label: "I'm an employee",
                                  onPressed: controller.getStarted,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              controller.currentPage.value == 0
                                  ? const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 7.5),
                                      child: Icon(
                                        MingCute.arrow_left_circle_fill,
                                        size: 40,
                                        color: navyColor,
                                      ),
                                    )
                                  : IconButton(
                                      style: const ButtonStyle(
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      color: Colors.white,
                                      iconSize: 40,
                                      onPressed: controller.prevPage,
                                      icon: const Icon(
                                          MingCute.arrow_left_circle_fill),
                                    ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    controller.onboardItem.length,
                                    (index) => AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      height: 10,
                                      width: 10,
                                      margin: EdgeInsets.only(
                                        right: index ==
                                                (controller.onboardItem.length -
                                                    1)
                                            ? 0
                                            : 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: index ==
                                                controller.currentPage.value
                                            ? Colors.white
                                            : Colors.grey.shade400,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                style: const ButtonStyle(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                color: Colors.white,
                                iconSize: 40,
                                onPressed: controller.nextPage,
                                icon: const Icon(
                                    MingCute.arrow_right_circle_fill),
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
            if (controller.currentPage.value !=
                controller.onboardItem.length - 1)
              Positioned(
                top: 15,
                left: 15,
                child: BaseTextButton(
                  text: 'Skip',
                  size: 14,
                  color: Colors.white,
                  onPressed: () => controller.movePage(3),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
