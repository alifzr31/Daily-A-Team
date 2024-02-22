import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoClockOutCard extends StatelessWidget {
  const NoClockOutCard({
    Key? key,
    required this.date,
    required this.dataLength,
    this.index,
  }) : super(key: key);

  final DateTime date;
  final int dataLength;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: softBlue,
        surfaceTintColor: softBlue,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        margin: EdgeInsets.only(
          right: index != (dataLength - 1) ? 10 : 0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              BaseText(text: AppHelpers.dayDateFormat(date)),
              const SizedBox(width: 10),
              SizedBox(
                width: 30,
                child: OutlinedButton(
                  clipBehavior: Clip.antiAlias,
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    side: MaterialStatePropertyAll(
                      BorderSide(color: navyColor),
                    ),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    )),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.zero,
                    ),
                  ),
                  onPressed: () => Get.toNamed(
                    '/reqAttendance',
                    arguments: {
                      'date': date,
                      'jenis': 'Pulang',
                    },
                  ),
                  child: const Icon(
                    Icons.arrow_right_alt,
                    size: 20,
                    color: navyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
