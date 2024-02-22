import 'package:dailyateam/app/modules/clock_in_out/widgets/clockinout_appbar.dart';
import 'package:dailyateam/app/modules/clock_in_out/widgets/clockinout_body.dart';
import 'package:flutter/material.dart';

class ClockInOutPage extends StatelessWidget {
  const ClockInOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClockInOutAppbar(),
      body: ClockInOutBody(),
    );
  }
}
