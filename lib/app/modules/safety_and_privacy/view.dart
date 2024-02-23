import 'package:dailyateam/app/components/base_appbar.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/safety_and_privacy/widgets/safetyandprivacy_body.dart';
import 'package:flutter/material.dart';

class SafetyAndPrivacyPage extends StatelessWidget {
  const SafetyAndPrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: Colors.white,
        fgColor: navyColor,
        title: 'Safety And Privacy',
      ),
      body: SafetyAndPrivacyBody(),
    );
  }
}
