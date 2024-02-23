import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/show_loading.dart';
import 'package:dailyateam/app/core/values/snackbars.dart';
import 'package:dailyateam/app/data/models/announcement.dart';
import 'package:dailyateam/app/data/models/breaktime.dart';
import 'package:dailyateam/app/data/models/inbox.dart';
import 'package:dailyateam/app/data/models/karyawan.dart';
import 'package:dailyateam/app/data/models/log_attendance.dart';
import 'package:dailyateam/app/data/providers/dashboard_provider.dart';
import 'package:dailyateam/app/modules/dashboard/components/bottomnav_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:open_filex/open_filex.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {
  final DashboardProvider dashboardProvider;

  DashboardController({required this.dashboardProvider});

  final currentPage = 0.obs;
  final navItems = [
    BottomNavModel(
      icon: MingCute.home_2_fill,
      label: 'Home',
    ),
    BottomNavModel(
      icon: MingCute.group_line,
      label: 'Employee',
    ),
    BottomNavModel(
      icon: MingCute.inbox_2_line,
      label: 'Inbox',
    ),
    BottomNavModel(
      icon: MingCute.user_3_line,
      label: 'Account',
    ),
  ].obs;

  final greeting = Rx<String?>(null);
  final currentDate = Rx<String?>(null);

  final levKar = Rx<String?>(null);

  final profile = Rx<Karyawan?>(null);
  final statusUser = false.obs;
  final idKaryawan = Rx<int?>(null);

  final announcement = <Announcement>[].obs;
  final announcementLoading = true.obs;

  final todayAttendance = Rx<Presensi?>(null);
  final noClockOut = <Presensi>[].obs;
  final noClockOutLoading = true.obs;

  final todayBreak = Rx<BreakTime?>(null);
  final todayBreakLoading = true.obs;
  final jenisBreak = Rx<String?>(null);

  final employeeLoading = true.obs;
  final hasMore = true.obs;
  final currentPageEmployee = 1.obs;
  final searchEmployee = Rx<String?>(null);
  final scrollController = ScrollController().obs;
  final employee = <Karyawan>[].obs;

  final inboxLoading = true.obs;
  final inbox = <Inbox>[].obs;

  final tabInfoIndex = 0.obs;
  final appName = Rx<String?>(null);
  final version = Rx<String?>(null);

  @override
  void onInit() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    appName.value = packageInfo.appName;
    version.value = packageInfo.version;
    idKaryawan.value = sharedPreferences.getInt('kar_id');

    startTimerGreeting();
    await fetchLevKar();
    if (levKar.value != null) {
      await fetchProfile();
      if (statusUser.value == true) {
        await fetchLogAttendance();
        await fetchBreakTime();
        await fetchAnnouncement();
        await fetchEmployee();
        scrollController.value.addListener(onScrollEmployee);
        levKar.value == '0'
            ? await fetchInboxStaff()
            : await fetchInboxManager();
      }
    }
    super.onInit();
  }

  @override
  void onClose() {
    announcement.clear();
    noClockOut.clear();
    employee.clear();
    scrollController.value.dispose();
    inbox.clear();
    super.onClose();
  }

  void changePage() {
    if (currentPage.value == 0) {
      navItems.value = [
        BottomNavModel(
          icon: MingCute.home_2_fill,
          label: 'Home',
        ),
        BottomNavModel(
          icon: MingCute.group_line,
          label: 'Employee',
        ),
        BottomNavModel(
          icon: MingCute.inbox_2_line,
          label: 'Inbox',
        ),
        BottomNavModel(
          icon: MingCute.user_3_line,
          label: 'Account',
        ),
      ];
    } else if (currentPage.value == 1) {
      navItems.value = [
        BottomNavModel(
          icon: MingCute.home_2_line,
          label: 'Home',
        ),
        BottomNavModel(
          icon: MingCute.group_fill,
          label: 'Employee',
        ),
        BottomNavModel(
          icon: MingCute.inbox_2_line,
          label: 'Inbox',
        ),
        BottomNavModel(
          icon: MingCute.user_3_line,
          label: 'Account',
        ),
      ];
    } else if (currentPage.value == 2) {
      navItems.value = [
        BottomNavModel(
          icon: MingCute.home_2_line,
          label: 'Home',
        ),
        BottomNavModel(
          icon: MingCute.group_line,
          label: 'Employee',
        ),
        BottomNavModel(
          icon: MingCute.inbox_2_fill,
          label: 'Inbox',
        ),
        BottomNavModel(
          icon: MingCute.user_3_line,
          label: 'Account',
        ),
      ];
    } else {
      navItems.value = [
        BottomNavModel(
          icon: MingCute.home_2_line,
          label: 'Home',
        ),
        BottomNavModel(
          icon: MingCute.group_line,
          label: 'Employee',
        ),
        BottomNavModel(
          icon: MingCute.inbox_2_line,
          label: 'Inbox',
        ),
        BottomNavModel(
          icon: MingCute.user_3_fill,
          label: 'Account',
        ),
      ];
    }
  }

  void startTimerGreeting() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      updateGreeting();
      currentDate.value = AppHelpers.dateFormat(DateTime.now());
    });
  }

  void updateGreeting() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 0 && hour < 4) {
      greeting.value = 'Good Evening';
    } else if (hour >= 4 && hour < 9) {
      greeting.value = 'Good Morning';
    } else if (hour >= 9 && hour < 15) {
      greeting.value = 'Have a nice day';
    } else if (hour >= 15 && hour < 18) {
      greeting.value = 'Good Afternoon';
    } else if (hour >= 18 && hour < 24) {
      greeting.value = 'Good Evening';
    } else {
      greeting.value = 'Good Evening';
    }
  }

  Future<void> fetchLevKar() async {
    try {
      final response = await dashboardProvider.fetchLevKar();

      if (response.statusCode == 200) {
        if (response.data['lev_kar_pic'] == '1') {
          levKar.value = response.data['lev_kar_pic'];
        } else {
          levKar.value = response.data['lev_kar_jabatan'];
        }
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        showLoading();
        await Future.delayed(const Duration(milliseconds: 1500), () async {
          Get.back();
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          await sharedPreferences.clear();
          await sharedPreferences.setBool('opened', true);
          infoSnackbar(
            "Ypu're logged out",
            'You have been logged out because your session is expired',
          );
          Get.offAllNamed('/login');
        });
      } else {
        failedSnackbar(
          'Fetching Lev Kar Failed',
          'Oooppss something went wrong. code:${e.response?.statusCode}',
        );
      }
    } finally {
      update();
    }
  }

  Future<void> fetchProfile() async {
    try {
      final response = await dashboardProvider.fetchProfile();

      if (response.statusCode == 200) {
        statusUser.value = response.data['user_aktif'];
        if (statusUser.value == false) {
          logout();
        } else {
          profile.value = karyawanFromJson(jsonEncode(response.data['kar'][0]));
        }
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Fetching Profile Failed',
        'Oooppss something went wrong. error:${e.response?.statusCode}',
      );
    } finally {
      update();
    }
  }

  Future<void> fetchLogAttendance() async {
    try {
      final response = await dashboardProvider.fetchLogAttendance();

      if (response.statusCode == 200) {
        final now =
            DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
        final List<LogAttendance> body = response.data['data'] == null
            ? []
            : listLogAttendanceFromJson(jsonEncode(response.data['data']));

        noClockOut.value = body.first.presensi
                ?.where((element) =>
                    element.jamMasuk != null &&
                    element.jamPulang == null &&
                    element.tanggal!.isAfter(
                      now.subtract(const Duration(days: 4)),
                    ) &&
                    element.tanggal != now)
                .toList() ??
            [];

        todayAttendance.value = body.first.presensi
            ?.firstWhereOrNull((element) => element.tanggal == now);
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Fetching Log Attendance Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      noClockOutLoading.value = false;
      update();
    }
  }

  Future<void> fetchBreakTime() async {
    try {
      final response = await dashboardProvider.fetchBreakTime(idKaryawan.value);

      if (response.statusCode == 200) {
        final List<BreakTime> body = response.data['data'] == null
            ? []
            : listBreakTimeFromJson(jsonEncode(response.data['data']));
        final now =
            DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
        todayBreak.value =
            body.firstWhereOrNull((element) => element.tanggal == now);
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Fetching Break Time Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      todayBreakLoading.value = false;
      update();
    }
  }

  Future<void> postBreakTime() async {
    final formData = dio.FormData.fromMap({
      'id_karyawan': idKaryawan.value,
      'jenis': jenisBreak.value,
    });

    todayBreakLoading.value = true;

    try {
      await dashboardProvider.postBreakTime(formData);
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Break Time Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      fetchBreakTime();
      update();
    }
  }

  Future<void> fetchAnnouncement() async {
    try {
      final response = await dashboardProvider.fetchAnnouncement();

      if (response.statusCode == 200) {
        final List<Announcement> body = response.data['data'] == null
            ? []
            : listAnnouncementFromJson(jsonEncode(response.data['data']));

        announcement.value = body;
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Fetching Announcement Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      announcementLoading.value = false;
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

  Future<void> refreshHome() async {
    await Future.delayed(const Duration(milliseconds: 2500), () async {
      levKar.value = null;
      profile.value = null;
      noClockOut.value = [];
      noClockOutLoading.value = true;
      todayBreak.value = null;
      todayBreakLoading.value = true;
      todayAttendance.value = null;
      announcement.value = [];
      announcementLoading.value = true;
      startTimerGreeting();
      await fetchLevKar();
      if (levKar.value != null) {
        await fetchProfile();
        if (statusUser.value == true) {
          await fetchLogAttendance();
          await fetchBreakTime();
          await fetchAnnouncement();
        }
      }
    });
  }

  Future<void> fetchEmployee() async {
    try {
      final response = await dashboardProvider.fetchEmployee(
          currentPageEmployee, searchEmployee.value);

      if (response.statusCode == 200) {
        final List<Karyawan> body = response.data['data']['data'] == null
            ? []
            : listKaryawanFromJson(jsonEncode(response.data['data']['data']));

        if (body.length < 20) {
          hasMore.value = false;
        }

        employee.addAll(body);
        currentPageEmployee.value++;
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Fetching Employee Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      employeeLoading.value = false;
      update();
    }
  }

  void onScrollEmployee() {
    final maxScroll = scrollController.value.position.maxScrollExtent;
    final currentScroll = scrollController.value.position.pixels;

    if (maxScroll == currentScroll && hasMore.value) {
      fetchEmployee();
    }
  }

  void findEmployee(String name) {
    searchEmployee.value = name;
    employeeLoading.value = true;
    currentPageEmployee.value = 1;
    hasMore.value = true;
    employee.clear();

    fetchEmployee();
  }

  Future<void> refreshEmployee() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      employeeLoading.value = true;
      currentPageEmployee.value = 1;
      hasMore.value = true;
      employee.clear();

      fetchEmployee();
    });
  }

  Future<void> fetchInboxStaff() async {
    try {
      final response = await dashboardProvider.fetchInboxStaff();

      if (response.statusCode == 200) {
        final List<Inbox> body = response.data['data'] == null
            ? []
            : listInboxFromJson(jsonEncode(response.data['data']));

        inbox.value = body;
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Fetching Inbox Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      inboxLoading.value = false;
      update();
    }
  }

  void markReadStaff(id) async {
    try {
      await dashboardProvider.markReadStaff(id);
    } on DioException catch (e) {
      failedSnackbar(
        'Read Inbox Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      fetchInboxStaff();
      update();
    }
  }

  Future<void> fetchInboxManager() async {
    try {
      final response = await dashboardProvider.fetchInboxManager();

      if (response.statusCode == 200) {
        final List<Inbox> body = response.data['data'] == null
            ? []
            : listInboxFromJson(jsonEncode(response.data['data']));

        inbox.value = body;
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Fetching Inbox Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      inboxLoading.value = false;
      update();
    }
  }

  void markReadManager(id) async {
    try {
      await dashboardProvider.markReadManager(id);
    } on DioException catch (e) {
      failedSnackbar(
        'Read Inbox Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      fetchInboxManager();
      update();
    }
  }

  Future<void> refreshInbox() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      inboxLoading.value = true;
      if (levKar.value == '0') {
        fetchInboxStaff();
      } else {
        fetchInboxManager();
      }
    });
  }

  Future<XFile?> pickImage(ImageSource imageSource) async {
    final picker = ImagePicker();
    return await picker.pickImage(
      source: imageSource,
      imageQuality: 40,
    );
  }

  void changePhotoProfile(ImageSource imageSource) async {
    await pickImage(imageSource).then((file) async {
      if (file != null) {
        if (await file.length() >= 3000000) {
          infoSnackbar(
            'File Size Too Large',
            'File size cannot more than 3 MB',
          );
        } else {
          final formData = dio.FormData.fromMap({
            'photo': await dio.MultipartFile.fromFile(file.path),
            '_method': 'put',
          });

          showLoading();

          try {
            final response = await dashboardProvider.changePhotoProfile(
              formData,
              idKaryawan.value,
            );

            if (response.statusCode == 200) {
              Get.back();
              profile.value = null;
              await fetchProfile();
              successSnackbar(
                'Change Photo Success',
                response.data['success'],
              );
            }
          } on DioException catch (e) {
            Get.back();
            failedSnackbar(
              'Change Photo Failed',
              e.response?.data['message'] ??
                  'Oooppss something went wrong. code:${e.response?.statusCode}',
            );
          } finally {
            await fetchProfile();
          }
        }
      }
    });
  }

  void logout() async {
    showLoading();

    try {
      final response = await dashboardProvider.logout();

      if (response.statusCode == 200) {
        Get.back();
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.clear();
        await sharedPreferences.setBool('opened', true);

        if (Get.currentRoute == '/dashboard') {
          if (statusUser.value) {
            infoSnackbar(
              'Log Out Success',
              'You have been logged out',
            );
          } else {
            infoSnackbar(
              "You're logged out",
              'You have been logged out because your account is not active',
            );
          }
        }
        Get.offAllNamed('/login');
      }
    } on dio.DioException catch (e) {
      failedSnackbar(
        'Log Out Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    }
  }
}
