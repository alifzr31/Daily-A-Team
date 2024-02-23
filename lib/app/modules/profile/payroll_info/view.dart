import 'package:dailyateam/app/components/base_appbar.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/profile/payroll_info/widgets/payrollinfo_body.dart';
import 'package:flutter/material.dart';

class PayrollInfoPage extends StatelessWidget {
  const PayrollInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: Colors.white,
        fgColor: navyColor,
        title: 'Payroll Info',
      ),
      body: PayrollInfoBody(),
    );
  }
}
