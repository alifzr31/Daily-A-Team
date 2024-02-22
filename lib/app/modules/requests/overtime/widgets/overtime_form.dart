import 'package:dailyateam/app/components/base_button.dart';
import 'package:dailyateam/app/components/base_dropdown.dart';
import 'package:dailyateam/app/components/base_formfield.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/requests/overtime/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OvertimeForm extends StatelessWidget {
  OvertimeForm({super.key});
  final controller = Get.find<OvertimeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Material(
          color: Colors.white,
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.formKey.value,
                      child: Column(
                        children: [
                          BaseFormField(
                            hint: controller.scheduleLoading.value
                                ? 'Please wait...'
                                : 'Pick Date Request',
                            controller: controller.dateController.value,
                            readOnly: true,
                            onTap: controller.jamMasukArgument.value == null
                                ? null
                                : () {
                                    DatePicker.showDatePicker(
                                      context,
                                      minTime: controller.schedule.last.tanggal,
                                      maxTime:
                                          controller.schedule.first.tanggal,
                                      currentTime:
                                          controller.selectedDate.value,
                                      onConfirm: (date) {
                                        controller.dateController.value.text =
                                            AppHelpers.dayDateFormat(date);
                                        controller.selectedDateString.value =
                                            DateFormat('yyyy-MM-dd')
                                                .format(date);
                                        controller.selectedDate.value =
                                            DateFormat('yyyy-MM-dd').parse(
                                                controller.selectedDateString
                                                        .value ??
                                                    '');

                                        controller.jamLoading.value = true;
                                        controller.jamPulang.value = null;
                                        controller.fetchSchedule(
                                          date: controller.selectedDate.value,
                                        );
                                        controller.startController.value.text =
                                            '';
                                        controller.selectedStart.value = null;
                                      },
                                    );
                                  },
                            validator: (value) {
                              if (controller.jamMasukArgument.value == null) {
                                return "You're not clock in today";
                              } else {
                                if (value!.isEmpty) {
                                  return 'Please pick your date request';
                                }
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          BaseFormField(
                            hint: controller.jamLoading.value
                                ? 'Please wait...'
                                : controller.selectedDate.value == null
                                    ? 'Please pick date request first'
                                    : 'Pick Start Time Request',
                            controller: controller.startController.value,
                            readOnly: true,
                            onTap: controller.selectedDate.value == null &&
                                    controller.jamLoading.isFalse
                                ? null
                                : () {
                                    DatePicker.showTimePicker(
                                      context,
                                      showSecondsColumn: false,
                                      currentTime:
                                          controller.selectedStart.value,
                                      onConfirm: (time) {
                                        final formatter = DateFormat('HH:mm');
                                        controller.startController.value.text =
                                            formatter.format(time);
                                        controller.selectedStart.value = time;
                                      },
                                    );
                                  },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please pick your start time request';
                              } else {
                                if (controller.selectedStart.value!.hour <
                                    controller.jamPulang.value!) {
                                  return 'Please pick start time after ${controller.jamPulang.value}:00';
                                }
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          BaseFormField(
                            hint: controller.selectedStart.value == null
                                ? 'Please pick start time first'
                                : 'Pick End Time Request',
                            controller: controller.endController.value,
                            readOnly: true,
                            onTap: controller.selectedStart.value == null
                                ? null
                                : () {
                                    DatePicker.showTimePicker(
                                      context,
                                      showSecondsColumn: false,
                                      currentTime: controller.selectedEnd.value,
                                      onConfirm: (time) {
                                        final formatter = DateFormat('HH:mm');
                                        controller.endController.value.text =
                                            formatter.format(time);
                                        controller.selectedEnd.value = time;
                                      },
                                    );
                                  },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please pick your end time request';
                              } else {
                                if (controller.selectedEnd.value!
                                        .difference(
                                            controller.selectedStart.value ??
                                                DateTime(0000))
                                        .inHours <
                                    2) {
                                  return 'Overtime must be a minimum of 2 hours';
                                }
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          BaseDropdown(
                            hint: 'Select Compensation',
                            value: controller.selectedCompensation.value,
                            items: controller.compensations
                                .map((element) => DropdownMenuItem(
                                      value: element,
                                      child: BaseText(text: element),
                                    ))
                                .toList(),
                            onChanged: (value) => controller
                                .selectedCompensation.value = value.toString(),
                            validator: (value) {
                              if (controller.selectedCompensation.value ==
                                  null) {
                                return 'Please choose what compensation you want';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          BaseFormField(
                            hint: 'Reason',
                            controller: controller.reasonController.value,
                            validator: (validator) {
                              if (validator!.isEmpty) {
                                return 'Please input your reason';
                              }

                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: BaseButton(
                    bgColor: navyColor,
                    fgColor: Colors.white,
                    label: 'Submit',
                    onPressed: () {
                      if (controller.formKey.value.currentState?.validate() ??
                          false) {
                        controller.postOvertime();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
