import 'package:dailyateam/app/modules/requests/req_attendance/widgets/reqattendance_appbar.dart';
import 'package:dailyateam/app/modules/requests/req_attendance/widgets/reqattendance_form.dart';
import 'package:dailyateam/app/modules/requests/req_attendance/widgets/reqattendance_log.dart';
import 'package:flutter/material.dart';

class ReqAttendancePage extends StatelessWidget {
  const ReqAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ReqAttendanceAppbar(),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ReqAttendanceForm(),
            ReqAttendanceLog(),
          ],
        ),
      ),
    );
  }
}
