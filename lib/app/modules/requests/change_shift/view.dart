import 'package:dailyateam/app/modules/requests/change_shift/widgets/changeshift_appbar.dart';
import 'package:dailyateam/app/modules/requests/change_shift/widgets/changeshift_form.dart';
import 'package:dailyateam/app/modules/requests/change_shift/widgets/changeshift_log.dart';
import 'package:flutter/material.dart';

class ChangeShiftPage extends StatelessWidget {
  const ChangeShiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ChangeShiftAppbar(),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ChangeShiftForm(),
            ChangeShiftLog(),
          ],
        ),
      ),
    );
  }
}
