import 'package:dailyateam/app/core/values/show_loading.dart';
import 'package:dailyateam/app/core/values/snackbars.dart';
import 'package:dailyateam/app/data/providers/profile/changepassword_provider.dart';
import 'package:dailyateam/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordController extends GetxController {
  final ChangePasswordProvider changePasswordProvider;

  ChangePasswordController({required this.changePasswordProvider});

  final userController = Get.find<DashboardController>();
  final currentPassword = Rx<String?>(null);

  final formKey = GlobalKey<FormState>().obs;
  final currentPasswordController = TextEditingController().obs;
  final obscureCurrentPass = true.obs;
  final newPasswordController = TextEditingController().obs;
  final obscureNewPass = true.obs;
  final confirmPasswordController = TextEditingController().obs;
  final obscureConfirmPass = true.obs;

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    currentPassword.value = sharedPreferences.getString('password');
    super.onInit();
  }

  @override
  void onClose() {
    currentPasswordController.value.dispose();
    newPasswordController.value.dispose();
    confirmPasswordController.value.dispose();
    super.onClose();
  }

  void changePassword() async {
    final formData = dio.FormData.fromMap({
      'email': userController.profile.value?.email,
      'password': newPasswordController.value.text,
      'confirm_password': confirmPasswordController.value.text,
    });

    showLoading();

    try {
      final response = await changePasswordProvider.changePassword(formData);

      if (response.statusCode == 200) {
        Get.back();
        successSnackbar(
          'Change Password Success',
          'Your password has been changed. Please log in again',
        );
        userController.logout();
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Change Password Failed',
        e.response?.data['message'] ??
            'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    }
  }
}
