import 'package:dailyateam/app/components/base_appbar.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/detail_employee/widgets/detailemployee_header.dart';
import 'package:dailyateam/app/modules/detail_employee/widgets/detailemployee_info.dart';
import 'package:flutter/material.dart';

class DetailEmployeePage extends StatelessWidget {
  const DetailEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: Colors.white,
        fgColor: navyColor,
        title: 'Employee Detail',
      ),
      body: Column(
        children: [
          DetailEmployeeHeader(),
          DetailEmployeeInfo(),
        ],
      ),
    );
  }
}
