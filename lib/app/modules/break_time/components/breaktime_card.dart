import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:flutter/material.dart';

class BreakTimeCard extends StatelessWidget {
  const BreakTimeCard({
    super.key,
    required this.breakOut,
    required this.date,
    required this.breakIn,
    this.index,
    this.dataLength,
  });

  final String breakOut;
  final DateTime date;
  final String breakIn;
  final int? index;
  final int? dataLength;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(bottom: index == (dataLength! - 1) ? 0 : 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Column(
              children: [
                const BaseText(
                  text: 'Out',
                  size: 12,
                ),
                BaseText(
                  text: breakOut,
                  bold: FontWeight.w600,
                ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Center(
                child: BaseText(
                  text: AppHelpers.dayDateFormat(date),
                  size: 12,
                  bold: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                const BaseText(
                  text: 'In',
                  size: 12,
                ),
                BaseText(
                  text: breakIn,
                  bold: FontWeight.w600,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
