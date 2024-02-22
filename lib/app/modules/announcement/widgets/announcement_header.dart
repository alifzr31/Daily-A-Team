import 'package:dailyateam/app/components/base_dropdown.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/components/base_textbutton.dart';
import 'package:dailyateam/app/modules/announcement/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementHeader extends StatelessWidget {
  AnnouncementHeader({super.key});
  final controller = Get.find<AnnouncementController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 185,
              child: Material(
                color: Colors.white,
                elevation: 1,
                borderRadius: BorderRadius.circular(5),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                  child: Row(
                    children: [
                      BaseText(
                        text: 'Year : ',
                        color: Colors.grey.shade600,
                        bold: FontWeight.w500,
                      ),
                      Expanded(
                        child: BaseDropdown(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          hint: controller.isLoading.value
                              ? 'Please wait...'
                              : 'Year',
                          value: controller.selectedYear.value,
                          items: controller.years
                              .map((element) => DropdownMenuItem(
                                    value: element,
                                    child: BaseText(text: element.toString()),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            controller.selectedYear.value =
                                int.parse(value.toString());
                            final startDate =
                                DateTime(controller.selectedYear.value!, 1, 1);
                            final endDate = DateTime(
                                controller.selectedYear.value!, 12, 31);
                            controller.filteredAnnouncement.value = controller
                                .announcement
                                .where((element) =>
                                    element.tanggal!.isAfter(
                                        startDate.subtract(const Duration())) &&
                                    element.tanggal!.isBefore(
                                        endDate.add(const Duration())))
                                .toList();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (controller.selectedYear.value != null)
              BaseTextButton(
                size: 14,
                color: Colors.red,
                text: 'Clear Filter',
                onPressed: () {
                  controller.selectedYear.value = null;
                },
              ),
          ],
        ),
      ),
    );
  }
}
