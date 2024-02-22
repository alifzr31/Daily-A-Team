import 'dart:convert';
import 'dart:io';

import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/values/snackbars.dart';
import 'package:dailyateam/app/data/models/announcement.dart';
import 'package:dailyateam/app/data/providers/announcement_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

class AnnouncementController extends GetxController {
  final AnnouncementProvider announcementProvider;

  AnnouncementController({required this.announcementProvider});

  final announcement = <Announcement>[].obs;
  final isLoading = true.obs;

  final years = <int>[].obs;
  final selectedYear = Rx<int?>(null);
  final filteredAnnouncement = <Announcement>[].obs;

  @override
  void onInit() {
    fetchAnnouncement();
    super.onInit();
  }

  @override
  void onClose() {
    announcement.clear();
    super.onClose();
  }

  Future<void> fetchAnnouncement() async {
    try {
      final response = await announcementProvider.fetchAnnouncement();

      if (response.statusCode == 200) {
        final List<Announcement> body = response.data['data'] == null
            ? []
            : listAnnouncementFromJson(jsonEncode(response.data['data']));

        announcement.value = body;
        Set<int> yearSet = {};
        for (var element in announcement) {
          yearSet.add(element.tanggal?.year ?? 0);
        }
        years.value = yearSet.toList();
        years.sort();
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Fetching Announcement Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      isLoading.value = false;
      update();
    }
  }

  void downloadAnnouncement({String? dokumen}) async {
    final dir = await getApplicationDocumentsDirectory();
    final saveDir = '${dir.path}/Download/Announcement';
    final saveFile = File('$saveDir/$dokumen');
    final dio = Dio(BaseOptions(baseUrl: ApiUrl.storageUrl));

    try {
      await dio.download(
        '/announcement/$dokumen',
        saveFile.path,
        onReceiveProgress: (count, total) async {
          final proggress = count / total * 100;

          if (proggress == 100.0) {
            await OpenFilex.open(saveFile.path);
          }
        },
      );
    } on DioException catch (e) {
      failedSnackbar(
        'Download Announcement Failed',
        e.response?.data.toString() ?? '',
      );
    }
  }

  Future<void> refreshAnnouncement() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      isLoading.value = true;
      announcement.clear();
      years.clear();
      selectedYear.value = null;
      fetchAnnouncement();
    });
  }
}
