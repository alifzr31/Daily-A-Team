import 'package:dailyateam/app/components/base_appbar.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/profile/employee_info/widgets/employeeinfo_body.dart';
import 'package:flutter/material.dart';

class EmployeeInfoPage extends StatelessWidget {
  const EmployeeInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: Colors.white,
        fgColor: navyColor,
        title: 'Employee Info',
      ),
      body: EmployeeInfoBody(),
    );
  }
}
