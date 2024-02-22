import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/onboard/widgets/onboard_body.dart';
import 'package:flutter/material.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navyColor,
      body: OnboardBody(),
    );
  }
}
