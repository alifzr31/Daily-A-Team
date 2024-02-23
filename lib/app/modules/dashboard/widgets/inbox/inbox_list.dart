import 'package:dailyateam/app/components/base_nodata.dart';
import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/modules/dashboard/components/inbox/inbox_card.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxList extends StatelessWidget {
  InboxList({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: controller.inboxLoading.value
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(15),
                itemCount: 25,
                itemBuilder: (context, index) {
                  return BaseShimmer(
                    child: InboxCard(
                      receiver: '',
                      sender: '',
                      title: '',
                      createdAt: DateTime(0000),
                      index: index,
                      dataLength: 25,
                    ),
                  );
                },
              )
            : controller.inbox.isEmpty
                ? BaseNoData(
                    image: 'inbox.svg',
                    title: 'Inbox Empty',
                    subtitle: 'Inbox is empty',
                    onPressed: () {
                      controller.inboxLoading.value = true;
                      controller.inbox.clear();
                      if (controller.levKar.value == '0') {
                        controller.fetchInboxStaff();
                      } else {
                        controller.fetchInboxManager();
                      }
                    },
                  )
                : RefreshIndicator(
                    onRefresh: controller.refreshInbox,
                    child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 35),
                      itemCount: controller.inbox.length,
                      itemBuilder: (context, index) {
                        final inbox = controller.inbox[index];

                        return InboxCard(
                          receiver: inbox.penerima?.name ?? '',
                          sender: inbox.pengirim?.name ?? '',
                          title: inbox.title ?? '',
                          createdAt: inbox.createdAt ?? DateTime(0000),
                          isiPengirim: inbox.isiPengirim,
                          isiPenerima: inbox.isiPenerima,
                          notes: inbox.notes,
                          statusBawahan: inbox.statusBawahan,
                          statusAtasan: inbox.statusAtasan,
                          levKar: controller.levKar.value,
                          dataLength: controller.inbox.length,
                          index: index,
                          onTap: () {
                            if (controller.levKar.value == '0') {
                              if (inbox.statusBawahan == 'unread') {
                                controller.markReadStaff(inbox.id);
                              }
                            } else {
                              if (inbox.statusAtasan == 'unread') {
                                controller.markReadManager(inbox.id);
                              }
                            }
                          },
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}
