import 'package:dailyateam/app/core/utils/firebase_notif.dart';
import 'package:dailyateam/app/core/values/show_loading.dart';
import 'package:dailyateam/app/core/values/snackbars.dart';
import 'package:dailyateam/app/data/providers/login_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginProvider loginProvider;

  LoginController({required this.loginProvider});

  final firebaseNotif = FirebaseNotif();

  final formKey = GlobalKey<FormState>().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final obscurePass = true.obs;

  @override
  void onClose() {
    emailController.value.dispose();
    passwordController.value.dispose();
    super.onClose();
  }

  void login() async {
    final formData = dio.FormData.fromMap({
      'email': emailController.value.text,
      'password': passwordController.value.text,
      'tkn': await firebaseNotif.getDeviceToken(),
    });

    showLoading();

    try {
      final response = await loginProvider.login(formData);

      if (response.statusCode == 200) {
        Get.back();

        if (response.data['lev_kar'] == null) {
          failedSnackbar(
            'Log In Failed',
            "You're not an employee",
          );
        } else {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          await sharedPreferences.setString('token', response.data['token']);
          await sharedPreferences.setInt('kar_id', response.data['karid']);
          await sharedPreferences.setString(
            'password',
            passwordController.value.text,
          );
          successSnackbar('Login Success', response.data['message']);
          Get.offAllNamed('/dashboard');
        }
      }
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        if (e.response?.data['message'] != null) {
          infoSnackbar(
            'Log In Failed',
            'Your account is not active',
          );
        } else {
          failedSnackbar(
            'Log In Failed',
            'Oooppss something went wrong. error:${e.response?.statusCode}',
          );
        }
      } else {
        infoSnackbar(
          'Log In Failed',
          e.response?.data['message'],
        );
      }
    }
  }
}
