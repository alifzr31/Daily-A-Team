import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/data/models/announcement.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeAnnouncementBottomSheet extends StatelessWidget {
  HomeAnnouncementBottomSheet({
    super.key,
    required this.announcement,
  });

  final Announcement announcement;
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          BaseText(
            text: AppHelpers.dateFormat(announcement.tanggal ?? DateTime(0000)),
            size: 12,
            color: Colors.grey.shade600,
            textAlign: TextAlign.center,
          ),
          BaseText(
            text: announcement.judul ?? '',
            size: 16,
            bold: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: HtmlWidget(
              AppHelpers.descAnnouncement(announcement.isi ?? ''),
              renderMode: RenderMode.listView,
              onTapUrl: (value) async {
                final url = Uri.parse(value);
                await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                );

                return true;
              },
            ),
          ),
          if (announcement.dokumen != null) const SizedBox(height: 10),
          if (announcement.dokumen != null)
            SizedBox(
              width: Get.width,
              child: Material(
                color: softBlue,
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(6),
                child: InkWell(
                  splashColor: navyColor.withOpacity(0.1),
                  onTap: () => controller.downloadAnnouncement(
                    dokumen: announcement.dokumen,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Center(
                            child: BaseText(
                              text: 'Download',
                              size: 16,
                              bold: FontWeight.w500,
                            ),
                          ),
                        ),
                        Brand(
                          Brands.adobe_acrobat_reader,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
