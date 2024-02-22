import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/components/base_textbutton.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/team/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamHeader extends StatelessWidget {
  TeamHeader({super.key});
  final controller = Get.find<TeamController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                controller.choices.length,
                (index) => Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: index == (controller.choices.length - 1) ? 0 : 10,
                    ),
                    child: Material(
                      color: controller.selectedStatus.value ==
                              controller.choices[index]
                          ? navyColor
                          : softBlue,
                      borderRadius: BorderRadius.circular(5),
                      clipBehavior: Clip.antiAlias,
                      elevation: controller.selectedStatus.value ==
                              controller.choices[index]
                          ? 1
                          : 0,
                      child: InkWell(
                        onTap: () {
                          controller.selectedStatus.value =
                              controller.choices[index];
                          controller.filteredTeam.clear();
                          controller.filteredTeam.value =
                              controller.team.where((element) {
                            return index == 0
                                ? element.presensiStatus
                                        .toString()
                                        .toLowerCase()
                                        .contains('late') ||
                                    element.presensiStatus
                                        .toString()
                                        .toLowerCase()
                                        .contains('earlyin') ||
                                    element.presensiStatus
                                        .toString()
                                        .toLowerCase()
                                        .contains('ontime')
                                : index == 1
                                    ? element.presensiStatus
                                            .toString()
                                            .toLowerCase()
                                            .contains('sakit') ||
                                        element.presensiStatus
                                            .toString()
                                            .toLowerCase()
                                            .contains(
                                                'sakit dengan surat dokter')
                                    : index == 2
                                        ? element.presensiStatus
                                            .toString()
                                            .toLowerCase()
                                            .contains('cuti tahunan')
                                        : index == 3
                                            ? element.presensiStatus == null
                                            : false;
                          }).toList();
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: BaseText(
                              text: controller.choices[index].capitalize ?? '',
                              color: controller.selectedStatus.value ==
                                      controller.choices[index]
                                  ? Colors.white
                                  : navyColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (controller.isLoading.isFalse) const SizedBox(height: 5),
            if (controller.isLoading.isFalse)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                    text: controller.selectedStatus.value == null
                        ? '${controller.team.length} Employee'
                        : '${controller.filteredTeam.length} Employee',
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 10),
                  if (controller.selectedStatus.value != null)
                    BaseTextButton(
                      text: 'Remove Filter',
                      size: 14,
                      color: Colors.red,
                      onPressed: () => controller.selectedStatus.value = null,
                    ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
