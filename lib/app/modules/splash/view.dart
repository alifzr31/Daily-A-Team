import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/splash/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: navyColor,
        body: SplashBody(),
      ),
    );
  }
}

class SplashBody extends StatelessWidget {
  SplashBody({super.key});
  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          height: 260,
          bottom: Get.height < 685 ? -80 : -40,
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            'assets/images/cloud_splash.svg',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'DAILY A-TEAM',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 8,
                  wordSpacing: 5,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Lottie.asset(
                'assets/lotties/logo.json',
                width: 180,
                frameRate: FrameRate(240),
                repeat: false,
              ),
              const SizedBox(height: 40),
              const CupertinoActivityIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 15,
          left: 0,
          right: 0,
          child: Column(
            children: [
              const BaseText(
                text: 'Powered By',
                color: navyColor,
                bold: FontWeight.w500,
              ),
              BaseText(
                text: 'DEV-IT AnyarGroup | ${DateTime.now().year}',
                color: navyColor,
                bold: FontWeight.w500,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
