import 'package:dailyateam/app/modules/dashboard/widgets/inbox/inbox_header.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/inbox/inbox_list.dart';
import 'package:flutter/material.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InboxHeader(),
        InboxList(),
      ],
    );
  }
}