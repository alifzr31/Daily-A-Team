import 'dart:io';

import 'package:dailyateam/app/components/base_button.dart';
import 'package:dailyateam/app/components/base_dropdown.dart';
import 'package:dailyateam/app/components/base_formfield.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/requests/time_off/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class TimeOffForm extends StatelessWidget {
  TimeOffForm({super.key});
  final controller = Get.find<TimeOffController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: controller.refreshForm,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Form(
                    key: controller.formKey.value,
                    child: Column(
                      children: [
                        BaseDropdown(
                          hint: controller.choiceLoading.value
                              ? 'Please Wait...'
                              : 'Select Reason',
                          value: controller.selectedReason.value,
                          items: controller.choiceLoading.value
                              ? null
                              : controller.choice
                                  .map((e) => DropdownMenuItem(
                                        value: e.type.toString().capitalize,
                                        child: BaseText(
                                          text: e.type.toString().capitalize ??
                                              '',
                                        ),
                                      ))
                                  .toList(),
                          onChanged: (value) {
                            controller.selectedSubReason.value = null;
                            controller.selectedReason.value = value.toString();

                            final filtered = controller.choice.firstWhereOrNull(
                                (e) => e.type.toString().capitalize!.contains(
                                    controller.selectedReason.value ?? ''));
                            controller.subChoice.value = filtered?.obj ?? [];

                            if (value == 'Other') {
                              controller.selectedSubReason.value =
                                  controller.subChoice.first.id.toString();
                            }
                          },
                          validator: (value) {
                            if (controller.selectedReason.value == null) {
                              return 'Please choose your reason request';
                            }

                            return null;
                          },
                        ),
                        if (controller.selectedReason.value != null)
                          const SizedBox(height: 15),
                        if (controller.selectedReason.value != null &&
                            controller.selectedReason.value != 'Other')
                          BaseDropdown(
                            hint: 'Select Detail Reason',
                            value: controller.selectedSubReason.value,
                            items:
                                int.parse(controller.cutiBalance.value ?? '0') <
                                        1
                                    ? controller.subChoice
                                        .where((e) => !e.nama
                                            .toString()
                                            .toLowerCase()
                                            .contains('cuti tahunan'))
                                        .map((e) => DropdownMenuItem(
                                              value: e.id.toString(),
                                              child: BaseText(
                                                text: e.nama
                                                        .toString()
                                                        .capitalize ??
                                                    '',
                                              ),
                                            ))
                                        .toList()
                                    : controller.subChoice
                                        .map((e) => DropdownMenuItem(
                                              value: e.id.toString(),
                                              child: BaseText(
                                                text: e.nama
                                                        .toString()
                                                        .capitalize ??
                                                    '',
                                              ),
                                            ))
                                        .toList(),
                            onChanged: (value) {
                              controller.selectedSubReason.value =
                                  value.toString();
                            },
                            validator: (value) {
                              if (controller.selectedSubReason.value == null) {
                                return 'Choose your sub reason request';
                              } else {
                                if (controller.selectedSubReason.value == '1' &&
                                    controller.picture.value?.path == null) {
                                  return 'Please take a picture of your sick letter';
                                }
                              }

                              return null;
                            },
                          ),
                        const SizedBox(height: 15),
                        BaseFormField(
                          controller: controller.dateController.value,
                          hint: 'Pick Date Request',
                          readOnly: true,
                          onTap: controller.selectedSubReason.value == null
                              ? null
                              : () {
                                  DatePicker.showDatePicker(
                                    context,
                                    locale: LocaleType.en,
                                    minTime: controller
                                                .selectedSubReason.value ==
                                            '1'
                                        ? DateTime.now()
                                            .subtract(const Duration(days: 3))
                                        : DateTime(DateTime.now().year, 1, 1),
                                    maxTime: controller
                                                .selectedSubReason.value ==
                                            '1'
                                        ? DateTime.now()
                                        : DateTime(DateTime.now().year, 12, 31),
                                    currentTime: controller.selectedDate.value,
                                    onConfirm: (date) {
                                      controller.selectedDate.value = date;
                                      controller.selectedDateString.value =
                                          DateFormat('yyyy-MM-dd').format(date);
                                      controller.dateController.value.text =
                                          AppHelpers.dayDateFormat(date);
                                    },
                                  );
                                },
                          validator: (value) {
                            if (controller.selectedSubReason.value == null) {
                              return 'Please choose detail reason first';
                            } else {
                              if (controller
                                  .dateController.value.text.isEmpty) {
                                return 'Pick your date request';
                              }
                            }

                            return null;
                          },
                        ),
                        if (controller.selectedSubReason.value == '1' &&
                            controller.picture.value != null)
                          const SizedBox(height: 15),
                        if (controller.selectedSubReason.value == '1' &&
                            controller.picture.value != null)
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.antiAlias,
                            elevation: 1,
                            child: Image.file(
                              File(controller.picture.value?.path ?? ''),
                            ),
                          ),
                        if (controller.selectedReason.value == 'Other')
                          BaseFormField(
                            hint: 'Notes',
                            controller: controller.notesController.value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please input your notes';
                              }

                              return null;
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              if (controller.selectedSubReason.value == '1')
                SizedBox(
                  width: Get.width,
                  child: BaseButton(
                    bgColor: navyColor,
                    fgColor: Colors.white,
                    label: 'Take a Picture',
                    onPressed: () async {
                      final imagePicker = ImagePicker();
                      await imagePicker
                          .pickImage(
                            source: ImageSource.camera,
                            imageQuality: 30,
                          )
                          .then(
                            (value) => controller.picture.value = value,
                          );
                    },
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
                      controller.postTimeOff();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
