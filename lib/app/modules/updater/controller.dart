import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdaterController extends GetxController {
  final currentVersion = Rx<String?>(null);
  final storeUrl = Rx<String?>(null);
  final storeVersion = Rx<String?>(null);

  @override
  void onInit() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    currentVersion.value = packageInfo.version;
    storeUrl.value = Get.arguments['storeUrl'];
    storeVersion.value = Get.arguments['storeVersion'];
    super.onInit();
  }

  void updateNow() async {
    final url = Uri.parse(storeUrl.value ?? '');
    final canLaunch = await canLaunchUrl(url);

    if (canLaunch) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
