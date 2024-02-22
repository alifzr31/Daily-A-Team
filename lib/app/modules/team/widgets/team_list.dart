import 'package:dailyateam/app/components/base_shimmer.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/modules/team/components/team_card.dart';
import 'package:dailyateam/app/modules/team/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamList extends StatelessWidget {
  TeamList({super.key});
  final controller = Get.find<TeamController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: controller.isLoading.value
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                itemCount: 25,
                itemBuilder: (context, index) {
                  return BaseShimmer(
                    child: TeamCard(
                      photo: '',
                      name: '',
                      jabatan: '',
                      employeeID: '',
                      presensiStatus: '',
                      reason: '',
                      index: index,
                      dataLength: 25,
                    ),
                  );
                },
              )
            : RefreshIndicator(
                onRefresh: controller.refreshTeam,
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                  itemCount: controller.selectedStatus.value == null
                      ? controller.team.length
                      : controller.filteredTeam.length,
                  itemBuilder: (context, index) {
                    final team = controller.selectedStatus.value == null
                        ? controller.team[index]
                        : controller.filteredTeam[index];
                    final jamMasuk =
                        AppHelpers.timeFormat(team.jamMasuk ?? DateTime(0000));
                    final jamPulang =
                        AppHelpers.timeFormat(team.jamPulang ?? DateTime(0000));

                    return TeamCard(
                      photo: team.karyawan?.photo ?? '',
                      name: team.karyawan?.namaLengkap ?? '',
                      jabatan: team.karyawan?.jabatan?.nama ?? '',
                      employeeID: team.karyawan?.nomorIndukKaryawan ?? '',
                      jamMasuk: team.jamMasuk == null ? null : jamMasuk,
                      jamPulang: team.jamPulang == null ? null : jamPulang,
                      presensiStatus: team.presensiStatus ?? '',
                      reason: team.keterangan ?? '-',
                      selectedStatus: controller.selectedStatus.value,
                      index: index,
                      dataLength: controller.team.length,
                    );
                  },
                ),
              ),
      ),
    );
  }
}
