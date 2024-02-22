import 'package:dailyateam/app/components/base_button.dart';
import 'package:dailyateam/app/components/base_dropdown.dart';
import 'package:dailyateam/app/components/base_formfield.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/requests/req_attendance/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReqAttendanceForm extends StatelessWidget {
  ReqAttendanceForm({super.key});
  final controller = Get.find<ReqAttendanceController>();

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
                            hint: 'Pick Date Request',
                            controller: controller.dateController.value,
                            readOnly: true,
                            onTap: () {
                              DatePicker.showDatePicker(
                                context,
                                minTime: DateTime.now()
                                    .subtract(const Duration(days: 3)),
                                maxTime: DateTime.now(),
                                currentTime: controller.selectedDate.value,
                                onConfirm: (date) {
                                  controller.selectedDate.value = date;
                                  controller.dateController.value.text =
                                      AppHelpers.dayDateFormat(date);
                                  controller.selectedDateString.value =
                                      DateFormat('yyyy-MM-dd').format(date);
                                },
                              );
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please pick your date request';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          BaseFormField(
                            hint: 'Pick Time Request',
                            controller: controller.timeController.value,
                            readOnly: true,
                            onTap: () {
                              DatePicker.showTimePicker(
                                context,
                                showSecondsColumn: false,
                                currentTime: controller.selectedTime.value,
                                onConfirm: (time) {
                                  final formatter = DateFormat('HH:mm');
                                  controller.timeController.value.text =
                                      formatter.format(time);
                                  controller.selectedTime.value = time;
                                },
                              );
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please pick your time request';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          BaseDropdown(
                            hint: 'Select Time',
                            value: controller.selectedJenis.value,
                            items: controller.jenis
                                .map((element) => DropdownMenuItem(
                                      value: element,
                                      child: BaseText(text: element),
                                    ))
                                .toList(),
                            onChanged: (value) => controller
                                .selectedJenis.value = value.toString(),
                            validator: (value) {
                              if (controller.selectedJenis.value == null) {
                                return 'Please choose your time request';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          BaseFormField(
                            hint: 'Reason',
                            controller: controller.reasonController.value,
                            validator: (value) {
                              if (value!.isEmpty) {
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
                        controller.postReqAttendance();
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
