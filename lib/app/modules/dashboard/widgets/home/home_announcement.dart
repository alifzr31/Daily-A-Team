import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/components/base_textbutton.dart';
import 'package:dailyateam/app/core/values/show_custombottomsheet.dart';
import 'package:dailyateam/app/modules/dashboard/components/home/homeannouncement_card.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/home/homeannouncement_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAnnouncement extends StatelessWidget {
  HomeAnnouncement({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 400,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 35),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            elevation: 1,
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: BaseText(
                      text: 'Announcement',
                      bold: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: controller.announcementLoading.value
                        ? ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return BaseShimmer(
                                child: HomeAnnouncementCard(
                                  title: '',
                                  date: DateTime(0000),
                                  dataLength: 3,
                                  index: index,
                                ),
                              );
                            },
                          )
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.announcement.length >= 3
                                ? controller.announcement.sublist(0, 3).length
                                : controller.announcement.length,
                            itemBuilder: (context, index) {
                              final announcement =
                                  controller.announcement.length >= 3
                                      ? controller.announcement
                                          .sublist(0, 3)[index]
                                      : controller.announcement[index];

                              return HomeAnnouncementCard(
                                title: announcement.judul ?? '',
                                date: announcement.tanggal ?? DateTime(0000),
                                document: announcement.dokumen,
                                dataLength: controller.announcement.length,
                                index: index,
                                onPressed: () {
                                  showCustomBottomSheet(
                                    height: 350,
                                    child: HomeAnnouncementBottomSheet(
                                      announcement: announcement,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                  ),
                  BaseTextButton(
                    size: 14,
                    color: Colors.grey.shade600,
                    text: 'View All',
                    onPressed: () => Get.toNamed('/announcement'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
