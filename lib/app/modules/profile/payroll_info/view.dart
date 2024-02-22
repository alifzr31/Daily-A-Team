import 'package:dailyateam/app/components/base_appbar.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:flutter/material.dart';

class PayrollInfoPage extends StatelessWidget {
  const PayrollInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BaseAppBar(
        bgColor: Colors.white,
        fgColor: navyColor,
        title: 'Payroll Info',
      ),
    );
  }
}
