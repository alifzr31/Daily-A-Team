import 'package:dailyateam/app/modules/dashboard/widgets/employee/employee_header.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/employee/employee_list.dart';
import 'package:flutter/material.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmployeeHeader(),
        EmployeeList(),
      ],
    );
  }
}