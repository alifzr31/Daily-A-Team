import 'package:dailyateam/app/modules/approve/widgets/approve_appbar.dart';
import 'package:dailyateam/app/modules/approve/widgets/approve_attendance.dart';
import 'package:dailyateam/app/modules/approve/widgets/approve_changeshift.dart';
import 'package:dailyateam/app/modules/approve/widgets/approve_overtime.dart';
import 'package:dailyateam/app/modules/approve/widgets/approve_timeoff.dart';
import 'package:flutter/material.dart';

class ApprovePage extends StatelessWidget {
  const ApprovePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: ApproveAppbar(),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ApproveAttendance(),
            ApproveTimeOff(),
            ApproveChangeShift(),
            ApproveOvertime(),
          ],
        ),
      ),
    );
  }
}
