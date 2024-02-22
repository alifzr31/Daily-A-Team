import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/data/models/log_attendance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LateOutCard extends StatelessWidget {
  const LateOutCard({
    Key? key,
    required this.title,
    required this.listData,
    required this.tag,
  }) : super(key: key);

  final String title;
  final List<Presensi> listData;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            width: Get.width,
            color: softBlue,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(
                  text: title,
                  size: 16,
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: listData.length.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: listData.length > 4 ? Colors.red : null,
                        ),
                      ),
                      TextSpan(
                        text: listData.length > 1 ? ' times' : ' time',
                        style: TextStyle(
                          fontSize: 16,
                          color: listData.length > 4 ? Colors.red : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Column(
              children: List.generate(
                listData.length,
                (index) {
                  final now = DateTime.parse(
                      DateFormat('yyyy-MM-dd').format(DateTime.now()));

                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: [
                                  TextSpan(
                                    text: DateFormat('E, ').format(
                                        listData[index].tanggal ??
                                            DateTime(0000)),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text: DateFormat('dd MMMM yyyy').format(
                                        listData[index].tanggal ??
                                            DateTime(0000)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          if (tag == 'late')
                            BaseText(
                              text: DateFormat.Hm().format(
                                  listData[index].jamMasuk ?? DateTime(0000)),
                              color: Colors.red,
                            ),
                          if (tag == 'noOut')
                            if (listData[index]
                                .tanggal!
                                .isAfter(now.subtract(const Duration(days: 4))))
                              SizedBox(
                                height: 30,
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                    padding: const MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(horizontal: 5),
                                    ),
                                    side: const MaterialStatePropertyAll(
                                      BorderSide(color: navyColor),
                                    ),
                                    foregroundColor:
                                        const MaterialStatePropertyAll(navyColor),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.toNamed(
                                      '/requestAttendance',
                                      arguments: listData[index].tanggal,
                                    );
                                  },
                                  child: const BaseText(
                                    text: 'Request Attendance',
                                    size: 12,
                                  ),
                                ),
                              ),
                        ],
                      ),
                      if (index != (listData.length - 1))
                        const SizedBox(height: 5),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
