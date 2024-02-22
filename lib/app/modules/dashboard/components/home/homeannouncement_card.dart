import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/components/base_textbutton.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeAnnouncementCard extends StatelessWidget {
  const HomeAnnouncementCard({
    Key? key,
    required this.title,
    required this.date,
    this.document,
    this.dataLength,
    this.index,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final DateTime date;
  final String? document;
  final int? dataLength;
  final int? index;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      surfaceTintColor: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(bottom: index == (dataLength ?? 0 - 1) ? 0 : 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            document == null
                ? const Icon(
                    MingCute.announcement_fill,
                    size: 40,
                    color: navyColor,
                  )
                : Brand(
                    Brands.adobe_acrobat_reader,
                    size: 40,
                  ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text: title,
                    bold: FontWeight.w500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  BaseText(
                    text: AppHelpers.dateFormat(date),
                    size: 12,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 15),
            BaseTextButton(
              text: 'Detail',
              size: 12,
              color: navyColor,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
