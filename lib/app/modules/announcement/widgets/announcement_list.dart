import 'package:dailyateam/app/components/base_nodata.dart';
import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/core/values/show_custombottomsheet.dart';
import 'package:dailyateam/app/modules/announcement/components/announcement_card.dart';
import 'package:dailyateam/app/modules/announcement/controller.dart';
import 'package:dailyateam/app/modules/announcement/widgets/announcement_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementList extends StatelessWidget {
  AnnouncementList({super.key});
  final controller = Get.find<AnnouncementController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: controller.isLoading.value
            ? ListView.builder(
                padding: const EdgeInsets.all(15),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 25,
                itemBuilder: (context, index) {
                  return BaseShimmer(
                    child: AnnouncementCard(
                      title: '',
                      date: DateTime(0000),
                      dataLength: 25,
                      index: index,
                    ),
                  );
                },
              )
            : controller.announcement.isEmpty
                ? BaseNoData(
                    image: 'announcement.svg',
                    title: 'Announcement Empty',
                    subtitle: 'Announcement is empty',
                    onPressed: () {
                      controller.isLoading.value = true;
                      controller.announcement.clear();
                      controller.fetchAnnouncement();
                    },
                  )
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    itemCount: controller.selectedYear.value == null
                        ? controller.announcement.length
                        : controller.filteredAnnouncement.length,
                    itemBuilder: (context, index) {
                      final announcement = controller.selectedYear.value == null
                          ? controller.announcement[index]
                          : controller.filteredAnnouncement[index];

                      return AnnouncementCard(
                        title: announcement.judul ?? '',
                        date: announcement.tanggal ?? DateTime(0000),
                        document: announcement.dokumen,
                        dataLength: controller.announcement.length,
                        index: index,
                        onPressed: () {
                          showCustomBottomSheet(
                            height: 350,
                            child: AnnouncementBottomSheet(
                                announcement: announcement),
                          );
                        },
                      );
                    },
                  ),
      ),
    );
  }
}
