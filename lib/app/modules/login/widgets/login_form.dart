import 'package:dailyateam/app/components/base_button.dart';
import 'package:dailyateam/app/components/base_formfield.dart';
import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/login/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: controller.formKey.value,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/login.svg',
                width: 220,
              ),
              const SizedBox(height: 40),
              LoginFormField(
                hint: 'Email',
                controller: controller.emailController.value,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please input your email';
                  } else {
                    if (!value.isEmail) {
                      return 'Email not valid';
                    }
                  }

                  return null;
                },
              ),
              const SizedBox(height: 15),
              LoginFormField(
                hint: 'Password',
                controller: controller.passwordController.value,
                obscureText: controller.obscurePass.value,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  color: Colors.white,
                  onPressed: () => controller.obscurePass.value =
                      !controller.obscurePass.value,
                  icon: Icon(controller.obscurePass.value
                      ? MingCute.eye_line
                      : MingCute.eye_close_line),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please input your password';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () async {
                    final url =
                        Uri.parse('https://karir.anyargroup.co.id/resetpass');
                    await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: BaseText(
                      text: 'Lupa Password?',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: Get.width,
                child: BaseButton(
                  bgColor: Colors.white,
                  fgColor: navyColor,
                  label: 'Log In',
                  onPressed: () {
                    if (controller.formKey.value.currentState?.validate() ??
                        false) {
                      controller.login();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
