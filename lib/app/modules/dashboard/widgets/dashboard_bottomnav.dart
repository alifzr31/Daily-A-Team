import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardBottomNav extends StatelessWidget {
  DashboardBottomNav({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedBottomNavigationBar.builder(
        activeIndex: controller.currentPage.value,
        gapLocation: GapLocation.center,
        scaleFactor: 0.2,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        elevation: 3,
        onTap: (index) {
          controller.currentPage.value = index;
          controller.changePage();
        },
        itemCount: controller.navItems.length,
        tabBuilder: (index, isActive) {
          final navItem = controller.navItems[index];

          return Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Badge(
                  label: BaseText(
                      text: controller.inbox
                                  .where((element) =>
                                      element.statusBawahan == 'unread')
                                  .toList()
                                  .length >
                              99
                          ? '99+'
                          : controller.inbox
                              .where((element) =>
                                  element.statusBawahan == 'unread')
                              .toList()
                              .length
                              .toString()),
                  isLabelVisible: index == 2
                      ? controller.inbox
                              .where((element) =>
                                  element.statusBawahan == 'unread')
                              .toList()
                              .isEmpty
                          ? false
                          : true
                      : false,
                  alignment: Alignment.topRight,
                  child: Icon(
                    navItem.icon,
                    color: isActive ? navyColor : const Color(0xFF979797),
                  ),
                ),
                BaseText(
                  text: navItem.label,
                  maxLines: 1,
                  size: 12,
                  color: isActive ? navyColor : const Color(0xFF979797),
                  bold: isActive ? FontWeight.w500 : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
