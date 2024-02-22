import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:flutter/material.dart';

class ApproveCard extends StatelessWidget {
  const ApproveCard({
    Key? key,
    required this.nama,
    required this.tag,
    this.jenis,
    this.date,
    this.shiftAwal,
    this.shiftAkhir,
    this.index,
    this.dataLength,
    this.onTap,
  }) : super(key: key);

  final String nama;
  final String tag;
  final String? jenis;
  final DateTime? date;
  final String? shiftAwal;
  final String? shiftAkhir;
  final int? index;
  final int? dataLength;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      margin: EdgeInsets.only(bottom: index == (dataLength! - 1) ? 0 : 10),
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      text: nama,
                      bold: FontWeight.w600,
                    ),
                    BaseText(
                      text: date == null
                          ? '$shiftAwal to $shiftAkhir'
                          : AppHelpers.dateFormat(date ?? DateTime(0000)),
                      size: 12,
                      color: Colors.grey.shade600,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              if (jenis != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    color: tag == 'attendance' && jenis == 'Masuk'
                        ? Colors.green.shade100
                        : tag == 'attendance' && jenis == 'Pulang' ||
                                tag == 'timeoff'
                            ? Colors.red.shade100
                            : Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: BaseText(
                    text: jenis ?? '',
                    bold: FontWeight.w500,
                    color: tag == 'attendance' && jenis == 'Masuk'
                        ? Colors.green.shade700
                        : tag == 'attendance' && jenis == 'Pulang' ||
                                tag == 'timeoff'
                            ? Colors.red.shade700
                            : Colors.amber.shade800,
                  ),
                ),
              const SizedBox(width: 10),
              const Icon(
                Icons.chevron_right,
                size: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
