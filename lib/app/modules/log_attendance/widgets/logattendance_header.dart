import 'package:dailyateam/app/components/base_dropdown.dart';
import 'package:dailyateam/app/components/base_iconbutton.dart';
import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/core/values/show_custombottomsheet.dart';
import 'package:dailyateam/app/modules/log_attendance/controller.dart';
import 'package:dailyateam/app/modules/log_attendance/widgets/lateout_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class LogAttendanceHeader extends StatelessWidget {
  LogAttendanceHeader({super.key});
  final controller = Get.find<LogAttendanceController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Material(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        elevation: 1,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              BaseText(
                text: 'Period',
                size: 12,
                color: Colors.grey.shade600,
              ),
              controller.isLoading.value
                  ? BaseShimmer(
                      child: Container(
                        height: 19,
                        width: 100,
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    )
                  : BaseText(
                      text: controller.periodName.value ?? '',
                      size: 16,
                      bold: FontWeight.w600,
                    ),
              Divider(
                color: Colors.grey.shade300,
                height: 15,
              ),
              Material(
                color: softBlue,
                clipBehavior: Clip.antiAlias,
                elevation: 1,
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            controller.isLoading.value
                                ? BaseShimmer(
                                    child: Container(
                                      height: 14,
                                      width: 150,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 3),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  )
                                : RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: [
                                        const TextSpan(text: 'Total late '),
                                        TextSpan(
                                          text: controller.lateAttendance.length
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: controller
                                                        .lateAttendance.length >
                                                    4
                                                ? Colors.red
                                                : null,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              controller.lateAttendance.length >
                                                      1
                                                  ? ' times'
                                                  : ' time',
                                          style: TextStyle(
                                            color: controller
                                                        .lateAttendance.length >
                                                    4
                                                ? Colors.red
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            controller.isLoading.value
                                ? BaseShimmer(
                                    child: Container(
                                      height: 14,
                                      width: 150,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 3),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  )
                                : RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: [
                                        const TextSpan(text: 'No clock out '),
                                        TextSpan(
                                          text: controller
                                              .noOutAttendance.length
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: controller
                                                    .noOutAttendance.isEmpty
                                                ? null
                                                : Colors.red,
                                          ),
                                        ),
                                        TextSpan(
                                          text: controller
                                                      .noOutAttendance.length >
                                                  1
                                              ? ' times'
                                              : ' time',
                                          style: TextStyle(
                                            color: controller
                                                    .noOutAttendance.isEmpty
                                                ? null
                                                : Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      controller.isLoading.value
                          ? BaseShimmer(
                              child: Container(
                                height: 30,
                                width: 30,
                                margin: const EdgeInsets.symmetric(vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            )
                          : BaseIconButton(
                              icon: MingCute.list_ordered_line,
                              size: 30,
                              color: navyColor,
                              onPressed: () {
                                showCustomBottomSheet(
                                  height: Get.height * 0.4,
                                  child: LateOutWidget(),
                                );
                              },
                            ),
                    ],
                  ),
                ),
              ),
              if (controller.isLoading.isFalse)
                Column(
                  children: [
                    const SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: BaseText(
                        text: 'Choose Period',
                        bold: FontWeight.w500,
                      ),
                    ),
                    Material(
                      color: Colors.white,
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10),
                      clipBehavior: Clip.antiAlias,
                      child: BaseDropdown(
                        hint: 'Choose Period',
                        value: controller.choosePeriod.value,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        items: controller.logAttendance
                            .map((e) => DropdownMenuItem(
                                  value: e.periodeNo,
                                  child: BaseText(
                                      text: e.periode?.replaceAll('sd', '-') ??
                                          ''),
                                ))
                            .toList(),
                        onChanged: (value) async {
                          await controller
                              .changePeriod(int.parse(value.toString()));
                          await controller.fetchLateAttendance();
                          await controller.fetchNoOutAttendance();
                        },
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
