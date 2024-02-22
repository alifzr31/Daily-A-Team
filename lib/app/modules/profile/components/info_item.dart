import 'package:dailyateam/app/components/base_text.dart';
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseText(
          text: title,
          size: 12,
          color: Colors.grey.shade600,
        ),
        BaseText(
          text: value,
          bold: FontWeight.w500,
        ),
        Divider(
          height: 15,
          color: Colors.grey.shade300,
        ),
      ],
    );
  }
}
