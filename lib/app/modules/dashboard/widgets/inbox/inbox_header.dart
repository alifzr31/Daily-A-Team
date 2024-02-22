import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxHeader extends StatelessWidget {
  InboxHeader({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: BaseText(
                  text: 'Inbox',
                  size: 20,
                  bold: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      const TextSpan(text: 'Total unread inbox : '),
                      TextSpan(
                        text: controller.inbox
                            .where((element) => controller.levKar.value == '0'
                                ? element.statusBawahan == 'unread'
                                : element.statusAtasan == 'unread')
                            .toList()
                            .length
                            .toString(),
                      ),
                    ],
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
