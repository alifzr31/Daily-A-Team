import 'dart:convert';

import 'package:dailyateam/app/core/values/snackbars.dart';
import 'package:dailyateam/app/data/models/team.dart';
import 'package:dailyateam/app/data/providers/team_provider.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TeamController extends GetxController {
  final TeamProvider teamProvider;

  TeamController({required this.teamProvider});

  final choices = [
    'in',
    'sakit',
    'cuti',
    'absent',
  ].obs;
  final selectedDate = Rx<DateTime?>(null);
  final selectedDateString = Rx<String?>(null);
  final selectedStatus = Rx<String?>(null);

  final isLoading = true.obs;
  final team = <Team>[].obs;
  final filteredTeam = <Team>[].obs;

  @override
  void onInit() {
    selectedDate.value = DateTime.now();
    selectedDateString.value = DateFormat('yyyy-MM-dd').format(
      selectedDate.value ?? DateTime(0000),
    );
    fetchTeam();
    super.onInit();
  }

  @override
  void onClose() {
    team.clear();
    super.onClose();
  }

  Future<void> fetchTeam() async {
    try {
      final response = await teamProvider.fetchTeam(
        date: selectedDateString.value,
      );

      if (response.statusCode == 200) {
        final List<Team> body = response.data['data'] == null
            ? []
            : listTeamFromJson(jsonEncode(response.data['data']));

        team.value = body;
      }
    } on DioException catch (e) {
      failedSnackbar(
        'Fetching Team Failed',
        'Oooppss something went wrong. code:${e.response?.statusCode}',
      );
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<void> refreshTeam() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {
      isLoading.value = true;
      team.clear();
      fetchTeam();
    });
  }
}
