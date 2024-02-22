import 'package:dailyateam/app/modules/onboard/components/onboard_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardController extends GetxController {
  final pageController = PageController().obs;
  final currentPage = 0.obs;

  final onboardItem = [
    OnBoardModel(
      title: 'Welcome to',
      secondTitle: 'Daily A-Team',
      image: 'assets/images/logo.svg',
      titleContent: 'HABIT',
      description:
          'Show enthusiasm and passion to do a good job and inspire others',
    ),
    OnBoardModel(
      image: 'assets/images/onboard1.svg',
      titleContent: 'ATTENDANCE',
      description:
          'All employee attendance recap of PT. Anyar Retail Indonesia is in the Daily A-Team application',
    ),
    OnBoardModel(
      image: 'assets/images/onboard2.svg',
      titleContent: 'FLEXIBLE',
      description:
          'Administrative activities of employees of PT. Anyar Retail Indonesia is all done at Daily A-Team',
    ),
    OnBoardModel(
      image: 'assets/images/onboard3.svg',
      titleContent: 'ENJOY YOUR JOB',
      description:
          'Make yourself qualified for PT. Anyar Retail Indonesia and of course for yourself',
    ),
  ].obs;

  @override
  void onClose() {
    pageController.value.dispose();
    super.onClose();
  }

  void nextPage() {
    pageController.value.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  void prevPage() {
    pageController.value.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  void movePage(pageIndex) {
    pageController.value.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
  }

  void candidate() async {
    final url = Uri.parse('https://karir.anyargroup.co.id');
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  void getStarted() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('opened', true);
    Get.offAndToNamed('/login');
  }
}
