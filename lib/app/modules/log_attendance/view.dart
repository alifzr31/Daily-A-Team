import 'package:dailyateam/app/components/base_appbar.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/log_attendance/widgets/logattendance_header.dart';
import 'package:dailyateam/app/modules/log_attendance/widgets/logattendance_list.dart';
import 'package:flutter/material.dart';

class LogAttendancePage extends StatelessWidget {
  const LogAttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: Colors.white,
        fgColor: navyColor,
        title: 'Log Attendance',
      ),
      body: Column(
        children: [
          LogAttendanceHeader(),
          LogAttendanceList(),
        ],
      ),
    );
  }
}
