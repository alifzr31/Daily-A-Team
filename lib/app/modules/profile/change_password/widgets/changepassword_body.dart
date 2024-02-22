import 'package:dailyateam/app/components/base_button.dart';
import 'package:dailyateam/app/components/base_formfield.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/profile/change_password/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class ChangePasswordBody extends StatelessWidget {
  ChangePasswordBody({super.key});
  final controller = Get.find<ChangePasswordController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: Material(
                color: Colors.white,
                elevation: 1,
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(10),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: controller.formKey.value,
                    child: Column(
                      children: [
                        BaseFormField(
                          hint: 'Current Password',
                          controller:
                              controller.currentPasswordController.value,
                          obscureText: controller.obscureCurrentPass.value,
                          suffixIcon: IconButton(
                            onPressed: () => controller.obscureCurrentPass
                                .value = !controller.obscureCurrentPass.value,
                            icon: Icon(
                              controller.obscureCurrentPass.value
                                  ? MingCute.eye_line
                                  : MingCute.eye_close_line,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please input your current password';
                            } else {
                              if (value != controller.currentPassword.value) {
                                return "Current password isn't correct";
                              }
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        BaseFormField(
                          hint: 'New Password',
                          controller: controller.newPasswordController.value,
                          obscureText: controller.obscureNewPass.value,
                          suffixIcon: IconButton(
                            onPressed: () => controller.obscureNewPass.value =
                                !controller.obscureNewPass.value,
                            icon: Icon(
                              controller.obscureNewPass.value
                                  ? MingCute.eye_line
                                  : MingCute.eye_close_line,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please input your new password';
                            } else {
                              if (value.length < 8) {
                                return 'New password must be a minimum of 8 characters';
                              } else {
                                if (value == controller.currentPassword.value) {
                                  return "New password can't same with current password";
                                } else {
                                  if (!AppHelpers.passwordValidation
                                      .hasMatch(value)) {
                                    return "New password must contain at least 1 uppercase letter, 1 lowercase letter, and 1 number";
                                  }
                                }
                              }
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        BaseFormField(
                          hint: 'Password Confirmation',
                          controller:
                              controller.confirmPasswordController.value,
                          obscureText: controller.obscureConfirmPass.value,
                          suffixIcon: IconButton(
                            onPressed: () => controller.obscureConfirmPass
                                .value = !controller.obscureConfirmPass.value,
                            icon: Icon(
                              controller.obscureConfirmPass.value
                                  ? MingCute.eye_line
                                  : MingCute.eye_close_line,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please input your password confirmation';
                            } else {
                              if (value !=
                                  controller.newPasswordController.value.text) {
                                return "Password confirmation doesn't match";
                              }
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: Get.width,
              child: BaseButton(
                bgColor: navyColor,
                fgColor: Colors.white,
                label: 'Change Password',
                onPressed: () {
                  if (controller.formKey.value.currentState?.validate() ??
                      false) {
                    controller.changePassword();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
