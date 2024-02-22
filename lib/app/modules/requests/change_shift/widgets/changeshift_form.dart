import 'package:dailyateam/app/components/base_button.dart';
import 'package:dailyateam/app/components/base_dropdown.dart';
import 'package:dailyateam/app/components/base_formfield.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/requests/change_shift/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class ChangeShiftForm extends StatelessWidget {
  ChangeShiftForm({super.key});
  final controller = Get.find<ChangeShiftController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: controller.refreshForm,
        child: Padding(
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
                      physics: const AlwaysScrollableScrollPhysics(),
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
                              onTap: controller.scheduleLoading.value
                                  ? null
                                  : () {
                                      DatePicker.showDatePicker(
                                        context,
                                        minTime:
                                            controller.schedule.last.tanggal,
                                        maxTime:
                                            controller.schedule.first.tanggal,
                                        currentTime:
                                            controller.selectedDate.value,
                                        onConfirm: (date) =>
                                            controller.chooseDate(date),
                                      );
                                    },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please choose your date request';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: BaseText(
                                    text: 'From Shift',
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: BaseText(
                                      text: 'To Shift',
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: BaseText(
                                    text: controller.fromShift.value ?? '-',
                                    size: 16,
                                    bold: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Icon(MingCute.transfer_3_line),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: BaseDropdown(
                                      hint: controller.fromShift.value == null
                                          ? '-'
                                          : controller.officeLoading.value
                                              ? 'Please wait...'
                                              : 'Select Shift',
                                      value: controller.selectedShift.value,
                                      items: controller.fromShift.value == null
                                          ? []
                                          : controller.office
                                              .map(
                                                  (element) => DropdownMenuItem(
                                                        value: element.id
                                                            .toString(),
                                                        child: BaseText(
                                                            text: element
                                                                    .jenisShift ??
                                                                ''),
                                                      ))
                                              .toList(),
                                      onChanged: (value) => controller
                                          .selectedShift
                                          .value = value.toString(),
                                      validator: (value) {
                                        if (controller.selectedShift.value ==
                                            null) {
                                          return 'Please choose your moving shift';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ],
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
                            if (controller.fromShift.value == 'Off')
                              Column(
                                children: [
                                  const SizedBox(height: 15),
                                  const BaseText(
                                    text:
                                        '*Jika kamu menukar off dengan hari kerja (op1, op2, ho)\nmaka silahkan isi tanggal dibawah ini untuk\nmenukar tanggal off',
                                    textAlign: TextAlign.center,
                                    size: 12,
                                    color: Colors.red,
                                  ),
                                  BaseFormField(
                                    hint: 'Pick Off Date',
                                    controller:
                                        controller.offDateController.value,
                                    readOnly: true,
                                    onTap: () {
                                      DatePicker.showDatePicker(
                                        context,
                                        minTime:
                                            controller.schedule.last.tanggal,
                                        maxTime:
                                            controller.schedule.first.tanggal,
                                        currentTime:
                                            controller.selectedOffDate.value,
                                        onConfirm: (date) =>
                                            controller.chooseOffDate(date),
                                      );
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please choose your moving off date';
                                      }

                                      return null;
                                    },
                                  ),
                                ],
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
                          controller.postChangeShift();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
