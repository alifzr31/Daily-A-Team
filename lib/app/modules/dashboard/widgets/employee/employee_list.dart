import 'package:dailyateam/app/components/base_nodata.dart';
import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/modules/dashboard/components/employee/employee_card.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeList extends StatelessWidget {
  EmployeeList({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: controller.employeeLoading.value
            ? ListView.builder(
                padding: const EdgeInsets.all(15),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 25,
                itemBuilder: (context, index) {
                  return const BaseShimmer(
                    child: EmployeeCard(
                      image: '',
                      name: '',
                      jobName: '',
                    ),
                  );
                },
              )
            : controller.employee.isEmpty
                ? BaseNoData(
                    image: 'employee.svg',
                    title: 'Employee Empty',
                    subtitle: 'Employee is empty',
                    onPressed: () {
                      controller.employeeLoading.value = true;
                      controller.currentPageEmployee.value = 1;
                      controller.hasMore.value = true;
                      controller.employee.clear();
                      controller.fetchEmployee();
                    },
                  )
                : RefreshIndicator(
                    onRefresh: controller.refreshEmployee,
                    child: ListView.builder(
                      controller: controller.scrollController.value,
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 35),
                      itemCount: controller.hasMore.value
                          ? controller.employee.length + 1
                          : controller.employee.length,
                      itemBuilder: (context, index) {
                        return index < controller.employee.length
                            ? EmployeeCard(
                                image: controller.employee[index].photo ?? '',
                                name: controller.employee[index].namaLengkap ??
                                    '',
                                jobName:
                                    controller.employee[index].jabatan?.nama ??
                                        '',
                                index: index,
                                onPressed: () => Get.toNamed(
                                  '/detailEmployee',
                                  arguments: {
                                    'employee': controller.employee[index],
                                  },
                                ),
                              )
                            : const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: CupertinoActivityIndicator(),
                              );
                      },
                    ),
                  ),
      ),
    );
  }
}
