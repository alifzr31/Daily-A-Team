import 'package:dailyateam/app/components/base_iconbutton.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    super.key,
    required this.jenisShift,
    required this.month,
    required this.day,
    required this.dayName,
    required this.clockIn,
    required this.clockOut,
    required this.difference,
    this.onPressed,
  });

  final String jenisShift;
  final String month;
  final String day;
  final String dayName;
  final String clockIn;
  final String clockOut;
  final String difference;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 10,
            color: jenisShift == 'Off' ? Colors.red : navyColor,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      BaseText(
                        text: month,
                        size: 12,
                        bold: FontWeight.w500,
                        color: jenisShift == 'Off' ? Colors.red : navyColor,
                      ),
                      BaseText(
                        text: day,
                        size: 20,
                        bold: FontWeight.w600,
                        color: jenisShift == 'Off' ? Colors.red : navyColor,
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseText(
                          text:
                              '$dayName $clockIn - $clockOut ($difference Hour)',
                          size: 12,
                          color: Colors.grey.shade600,
                        ),
                        BaseText(
                          text: jenisShift,
                          size: 16,
                          bold: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  BaseIconButton(
                    icon: MingCute.edit_4_line,
                    color: navyColor,
                    onPressed: onPressed,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
