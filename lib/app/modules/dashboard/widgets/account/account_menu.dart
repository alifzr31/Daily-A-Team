import 'package:dailyateam/app/components/base_button.dart';
import 'package:dailyateam/app/components/base_formfield.dart';
import 'package:dailyateam/app/components/base_listtile.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/core/values/show_custombottomsheet.dart';
import 'package:dailyateam/app/modules/dashboard/components/account/accountmenu_item.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountMenu extends StatelessWidget {
  AccountMenu({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          AccountMenuItem(
            title: 'My Info',
            menuItems: [
              BaseListTile(
                leading: const Icon(MingCute.receive_money_line),
                title: 'Payroll Info',
                subtitle: 'subtitle',
                trailing: const Icon(
                  EvaIcons.chevron_right,
                  size: 25,
                ),
                onTap: () async {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  final formKey = GlobalKey<FormState>().obs;
                  final passwordController = TextEditingController().obs;
                  final obscurePass = true.obs;
                  final currentPassword =
                      sharedPreferences.getString('password');
                  showCustomBottomSheet(
                    height: 220,
                    child: Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            const BaseText(
                              text: 'Input Your Password',
                              size: 16,
                              bold: FontWeight.w600,
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Form(
                                    key: formKey.value,
                                    child: BaseFormField(
                                      hint: 'Password',
                                      autofocus: true,
                                      controller: passwordController.value,
                                      obscureText: obscurePass.value,
                                      suffixIcon: IconButton(
                                        onPressed: () => obscurePass.value =
                                            !obscurePass.value,
                                        icon: Icon(
                                          obscurePass.value
                                              ? MingCute.eye_line
                                              : MingCute.eye_close_line,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please input your password';
                                        } else {
                                          if (value != currentPassword) {
                                            return "Password isn't correct";
                                          }
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  SizedBox(
                                    width: Get.width,
                                    child: BaseButton(
                                      bgColor: navyColor,
                                      fgColor: Colors.white,
                                      label: 'Submit',
                                      onPressed: () {
                                        if (formKey.value.currentState
                                                ?.validate() ??
                                            false) {
                                          Get.back();
                                          Get.toNamed(
                                            '/payrollInfo',
                                            arguments: {
                                              'name': controller.profile.value?.namaLengkap,
                                              'jabatan': controller.profile.value?.jabatan?.nama,
                                              'photo': controller.profile.value?.photo,
                                            },
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              BaseListTile(
                leading: const Icon(MingCute.documents_line),
                title: 'Documents Info',
                subtitle: 'subtitle',
                trailing: const Icon(
                  EvaIcons.chevron_right,
                  size: 25,
                ),
                onTap: () => Get.toNamed('/documentInfo'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          AccountMenuItem(
            title: 'Settings',
            menuItems: [
              BaseListTile(
                leading: const Icon(MingCute.lock_line),
                title: 'Change Password',
                subtitle: 'subtitle',
                trailing: const Icon(
                  EvaIcons.chevron_right,
                  size: 25,
                ),
                onTap: () => Get.toNamed('/changePassword'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          AccountMenuItem(
            title: 'Others',
            menuItems: [
              BaseListTile(
                leading: const Icon(MingCute.chat_1_line),
                title: 'Term of Use',
                subtitle: 'subtitle',
                trailing: const Icon(
                  EvaIcons.chevron_right,
                  size: 25,
                ),
                onTap: () => Get.toNamed('/termOfUse'),
              ),
              BaseListTile(
                leading: const Icon(MingCute.safety_certificate_line),
                title: 'Safety and Privacy',
                subtitle: 'subtitle',
                trailing: const Icon(
                  EvaIcons.chevron_right,
                  size: 25,
                ),
                onTap: () => Get.toNamed('/safetyAndPrivacy'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
