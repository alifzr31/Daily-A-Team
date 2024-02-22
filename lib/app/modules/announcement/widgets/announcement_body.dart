import 'package:dailyateam/app/modules/announcement/controller.dart';
import 'package:dailyateam/app/modules/announcement/widgets/announcement_header.dart';
import 'package:dailyateam/app/modules/announcement/widgets/announcement_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementBody extends StatelessWidget {
  AnnouncementBody({super.key});
  final controller = Get.find<AnnouncementController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: controller.refreshAnnouncement,
        child: Column(
          children: [
            if (controller.isLoading.isFalse) AnnouncementHeader(),
            const SizedBox(height: 15),
            AnnouncementList(),
          ],
        ),
      ),
    );
  }
}
