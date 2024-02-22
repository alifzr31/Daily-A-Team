import 'package:dailyateam/app/modules/dashboard/components/home/menu_item.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeMenu extends StatelessWidget {
  HomeMenu({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.levKar.value == '0'
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuItem(
                    bgColor: const Color(0xFFEEE9FF),
                    color: const Color(0xFF917FFB),
                    icon: 'schedule.svg',
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    label: 'Schedule',
                    onPressed: () => Get.toNamed('/schedule'),
                  ),
                  const SizedBox(width: 15),
                  MenuItem(
                    bgColor: const Color(0xFFFFE5CA),
                    color: const Color(0xFFD99048),
                    icon: 'breaktime.svg',
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    label: 'Break Time',
                    onPressed: () => Get.toNamed('/breakTime'),
                  ),
                  const SizedBox(width: 15),
                  MenuItem(
                    bgColor: const Color(0xFFE1F0FF),
                    color: const Color(0xFF0E71D3),
                    icon: 'attendance.svg',
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    label: 'Attendance',
                    onPressed: () => Get.toNamed('/logAttendance'),
                  ),
                  if (controller.levKar.value != '0')
                    MenuItem(
                      bgColor: const Color(0xFFE1F0FF),
                      color: const Color(0xFF0E71D3),
                      icon: 'attendance.svg',
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: 'Attendance',
                      onPressed: () => Get.dialog(
                        Container(),
                      ),
                    ),
                ],
              ),
            )
          : Get.width < 360
              ? SizedBox(
                  height: 85,
                  width: Get.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    children: [
                      MenuItem(
                        bgColor: const Color(0xFFEEE9FF),
                        color: const Color(0xFF917FFB),
                        icon: 'schedule.svg',
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        label: 'Schedule',
                        onPressed: () => Get.toNamed('/schedule'),
                      ),
                      const SizedBox(width: 15),
                      MenuItem(
                        bgColor: const Color(0xFFFFE5CA),
                        color: const Color(0xFFD99048),
                        icon: 'breaktime.svg',
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        label: 'Break Time',
                        onPressed: () => Get.toNamed('/breakTime'),
                      ),
                      const SizedBox(width: 15),
                      MenuItem(
                        bgColor: const Color(0xFFE1F0FF),
                        color: const Color(0xFF0E71D3),
                        icon: 'attendance.svg',
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        label: 'Attendance',
                        onPressed: () => Get.toNamed('/logAttendance'),
                      ),
                      if (controller.levKar.value != '0')
                        const SizedBox(width: 15),
                      if (controller.levKar.value != '0')
                        MenuItem(
                          bgColor: const Color(0xFFEDFBD8),
                          color: const Color(0xFF319200),
                          icon: 'approve.svg',
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          label: 'Approve',
                          onPressed: () => Get.toNamed('/approve'),
                        ),
                      if (controller.levKar.value != '0')
                        const SizedBox(width: 15),
                      if (controller.levKar.value != '0')
                        MenuItem(
                          bgColor: const Color(0xFFEDF2F8),
                          color: const Color(0xFF38597C),
                          icon: 'team.svg',
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          label: 'Team',
                          onPressed: () => Get.toNamed('/team'),
                        ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: controller.levKar.value == '0' ? 30 : 15,
                  ),
                  child: SizedBox(
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MenuItem(
                          bgColor: const Color(0xFFEEE9FF),
                          color: const Color(0xFF917FFB),
                          icon: 'schedule.svg',
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          label: 'Schedule',
                          onPressed: () => Get.toNamed('/schedule'),
                        ),
                        const SizedBox(width: 15),
                        MenuItem(
                          bgColor: const Color(0xFFFFE5CA),
                          color: const Color(0xFFD99048),
                          icon: 'breaktime.svg',
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          label: 'Break Time',
                          onPressed: () => Get.toNamed('/breakTime'),
                        ),
                        const SizedBox(width: 15),
                        MenuItem(
                          bgColor: const Color(0xFFE1F0FF),
                          color: const Color(0xFF0E71D3),
                          icon: 'attendance.svg',
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          label: 'Attendance',
                          onPressed: () => Get.toNamed('/logAttendance'),
                        ),
                        if (controller.levKar.value != '0')
                          const SizedBox(width: 15),
                        if (controller.levKar.value != '0')
                          MenuItem(
                            bgColor: const Color(0xFFEDFBD8),
                            color: const Color(0xFF319200),
                            icon: 'approve.svg',
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: 'Approve',
                            onPressed: () => Get.toNamed('/approve'),
                          ),
                        if (controller.levKar.value != '0')
                          const SizedBox(width: 15),
                        if (controller.levKar.value != '0')
                          MenuItem(
                            bgColor: const Color(0xFFEDF2F8),
                            color: const Color(0xFF38597C),
                            icon: 'team.svg',
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: 'Team',
                            onPressed: () => Get.toNamed('/team'),
                          ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
