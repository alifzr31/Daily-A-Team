import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

class InboxCard extends StatelessWidget {
  const InboxCard({
    Key? key,
    required this.receiver,
    required this.sender,
    required this.title,
    required this.createdAt,
    this.isiPengirim,
    this.isiPenerima,
    this.notes,
    this.statusBawahan,
    this.statusAtasan,
    this.levKar,
    this.onTap,
    this.dataLength,
    this.index,
  }) : super(key: key);

  final String receiver;
  final String sender;
  final String title;
  final DateTime createdAt;
  final String? isiPengirim;
  final String? isiPenerima;
  final String? notes;
  final String? statusBawahan;
  final String? statusAtasan;
  final String? levKar;
  final void Function()? onTap;
  final int? dataLength;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: index == (dataLength! - 1) ? 0 : 10),
      child: Material(
        color: levKar == '0'
            ? statusBawahan == 'unread'
                ? softBlue
                : Colors.white
            : statusAtasan == 'unread'
                ? softBlue
                : Colors.white,
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(27, 15, 27, 0),
                child: BaseText(
                  text: levKar == '0' ? receiver : sender,
                  bold: FontWeight.w600,
                  color: navyColor,
                ),
              ),
            ),
            ExpandedTile(
              contentseparator: 0,
              theme: ExpandedTileThemeData(
                contentRadius: 0,
                headerRadius: 0,
                headerPadding: const EdgeInsets.all(15),
                contentPadding: const EdgeInsets.fromLTRB(26, 0, 26, 15),
                headerColor: levKar == '0'
                    ? statusBawahan == 'unread'
                        ? softBlue
                        : Colors.white
                    : statusAtasan == 'unread'
                        ? softBlue
                        : Colors.white,
                contentBackgroundColor: levKar == '0'
                    ? statusBawahan == 'unread'
                        ? softBlue
                        : Colors.white
                    : statusAtasan == 'unread'
                        ? softBlue
                        : Colors.white,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text: title.replaceFirst(' ', ''),
                    size: 14,
                    bold: FontWeight.w500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  BaseText(
                    text: AppHelpers.dateFormat(createdAt),
                    size: 12,
                    color: Colors.grey.shade600,
                  )
                ],
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    height: 0,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 15),
                  BaseText(
                    text: levKar == '0' ? isiPengirim ?? '' : isiPenerima ?? '',
                  ),
                  if (notes != null) const SizedBox(height: 10),
                  if (notes != null)
                    BaseText(
                      text: 'Reason :',
                      size: 12,
                      color: Colors.grey.shade600,
                    ),
                  if (notes != null) BaseText(text: notes ?? ''),
                ],
              ),
              onTap: onTap,
              controller: ExpandedTileController(),
            ),
          ],
        ),
      ),
    );
  }
}
