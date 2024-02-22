import 'package:dailyateam/app/components/base_appbar.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/break_time/widgets/breaktime_body.dart';
import 'package:flutter/material.dart';

class BreakTimePage extends StatelessWidget {
  const BreakTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: Colors.white,
        fgColor: navyColor,
        title: 'Break Time',
      ),
      body: BreakTimeBody(),
    );
  }
}
