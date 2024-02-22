import 'package:dailyateam/app/modules/requests/overtime/widgets/overtime_appbar.dart';
import 'package:dailyateam/app/modules/requests/overtime/widgets/overtime_form.dart';
import 'package:dailyateam/app/modules/requests/overtime/widgets/overtime_log.dart';
import 'package:flutter/material.dart';

class OvertimePage extends StatelessWidget {
  const OvertimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: OvertimeAppbar(),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            OvertimeForm(),
            OvertimeLog(),
          ],
        ),
      ),
    );
  }
}
