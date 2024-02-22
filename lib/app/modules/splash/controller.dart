import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_version_update/app_version_update.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    checkUpdate();
    super.onInit();
  }

  Future<void> checkUpdate() async {
    await AppVersionUpdate.checkForUpdates(
      playStoreId: 'id.co.anyargroup.hris',
      country: 'id',
    ).then((result) async {
      if (result.canUpdate!) {
        await Future.delayed(const Duration(seconds: 3), () {
          Get.offAndToNamed(
            '/updater',
            arguments: {
              'storeUrl': result.storeUrl,
              'storeVersion': result.storeVersion,
            },
          );
        });
      } else {
        navigator();
      }
    });
  }

  void navigator() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final opened = sharedPreferences.getBool('opened');
    final token = sharedPreferences.getString('token');

    Timer(const Duration(seconds: 3), () {
      if (opened == true || opened != null) {
        if (token != null) {
          Get.offAllNamed('/dashboard');
        } else {
          Get.offAllNamed('/login');
        }
      } else {
        Get.offAllNamed('/onboard');
      }
    });
  }
}
