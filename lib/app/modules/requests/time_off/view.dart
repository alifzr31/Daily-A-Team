import 'package:dailyateam/app/components/base_appbar.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/requests/time_off/widgets/timeoff_body.dart';
import 'package:dailyateam/app/modules/requests/time_off/widgets/timeoff_header.dart';
import 'package:flutter/material.dart';

class TimeOffPage extends StatelessWidget {
  const TimeOffPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: Colors.white,
        fgColor: navyColor,
        title: 'Time Off',
      ),
      body: Column(
        children: [
          TimeOffHeader(),
          TimeOffBody(),
        ],
      ),
    );
  }
}
