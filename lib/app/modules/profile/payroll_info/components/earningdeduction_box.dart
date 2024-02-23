import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class EarningDeductionBox extends StatelessWidget {
  const EarningDeductionBox({
    super.key,
    required this.basicSalary,
    required this.transport,
    required this.makan,
    required this.alpha,
    this.isLoading = true,
  });

  final bool isLoading;
  final int basicSalary;
  final int transport;
  final int makan;
  final int alpha;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseText(
                          text: 'Earnings',
                          bold: FontWeight.w600,
                        ),
                        SizedBox(height: 10),
                        BaseText(
                          text: 'Basic Salary',
                        ),
                        SizedBox(height: 5),
                        BaseText(
                          text: 'Tunjangan Transport',
                        ),
                        SizedBox(height: 5),
                        BaseText(
                          text: 'Tunjangan Makan',
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            const Icon(
                              MingCute.currency_dollar_2_line,
                              size: 20,
                              color: Colors.green,
                            ),
                            const SizedBox(height: 10),
                            isLoading
                                ? BaseShimmer(
                                    child: Container(
                                      height: 15,
                                      width: 120,
                                      margin: const EdgeInsets.only(
                                        bottom: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  )
                                : BaseText(
                                    text: AppHelpers.rupiahFormat(basicSalary),
                                    bold: FontWeight.w500,
                                  ),
                            const SizedBox(height: 5),
                            isLoading
                                ? BaseShimmer(
                                    child: Container(
                                      height: 15,
                                      width: 120,
                                      margin: const EdgeInsets.only(
                                        bottom: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  )
                                : BaseText(
                                    text: AppHelpers.rupiahFormat(transport),
                                    bold: FontWeight.w500,
                                  ),
                            const SizedBox(height: 5),
                            isLoading
                                ? BaseShimmer(
                                    child: Container(
                                      height: 15,
                                      width: 120,
                                      margin: const EdgeInsets.only(
                                        bottom: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  )
                                : BaseText(
                                    text: AppHelpers.rupiahFormat(makan),
                                    bold: FontWeight.w500,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Get.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                color: softBlue,
                child: Row(
                  children: [
                    const BaseText(text: 'Total Earnings'),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: isLoading
                            ? BaseShimmer(
                                child: Container(
                                  height: 15,
                                  width: 120,
                                  margin: const EdgeInsets.only(
                                    bottom: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              )
                            : BaseText(
                                text: AppHelpers.rupiahFormat(
                                  basicSalary + transport + makan,
                                ),
                                bold: FontWeight.w500,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Material(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseText(
                          text: 'Deductions',
                          bold: FontWeight.w600,
                        ),
                        SizedBox(height: 10),
                        BaseText(
                          text: 'Potongan Alpha',
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            const Icon(
                              MingCute.currency_dollar_2_line,
                              size: 20,
                              color: Colors.red,
                            ),
                            const SizedBox(height: 10),
                            isLoading
                                ? BaseShimmer(
                                    child: Container(
                                      height: 15,
                                      width: 120,
                                      margin: const EdgeInsets.only(
                                        bottom: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  )
                                : BaseText(
                                    text: AppHelpers.rupiahFormat(alpha),
                                    bold: FontWeight.w500,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Get.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                color: softBlue,
                child: Row(
                  children: [
                    const BaseText(text: 'Total Deductions'),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: isLoading
                            ? BaseShimmer(
                                child: Container(
                                  height: 15,
                                  width: 120,
                                  margin: const EdgeInsets.only(
                                    bottom: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              )
                            : BaseText(
                                text: AppHelpers.rupiahFormat(alpha),
                                bold: FontWeight.w500,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
