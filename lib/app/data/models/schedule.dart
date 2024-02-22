// To parse this JSON data, do
//
//     final Schedule = ScheduleFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Schedule scheduleFromJson(String str) => Schedule.fromJson(json.decode(str));

String scheduleToJson(Schedule data) => json.encode(data.toJson());

List<Schedule> listScheduleFromJson(String str) =>
    List<Schedule>.from(json.decode(str).map((x) => Schedule.fromJson(x)));

String listScheduleToJson(List<Schedule> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Schedule extends Equatable {
  final DateTime? tanggal;
  final int? idParampresensi;
  final Parampresensi? parampresensi;

  const Schedule({
    this.tanggal,
    this.idParampresensi,
    this.parampresensi,
  });

  @override
  List<Object?> get props => [
        tanggal,
        idParampresensi,
        parampresensi,
      ];

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        tanggal: DateTime.parse(json["tanggal"]),
        idParampresensi: json["id_parampresensi"],
        parampresensi: json["parampresensi"] == null
            ? null
            : Parampresensi.fromJson(json["parampresensi"]),
      );

  Map<String, dynamic> toJson() => {
        "tanggal":
            "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "id_parampresensi": idParampresensi,
        "parampresensi": parampresensi?.toJson(),
      };
}

class Parampresensi extends Equatable {
  final int? id;
  final DateTime? createdAt;
  final dynamic updatedAt;
  final String? jenisKaryawan;
  final int? fkCabang;
  final dynamic fkLevelJabatan;
  final String? awalAbsenMasuk;
  final String? jamMasuk;
  final String? maksTelat;
  final String? jamPulang;
  final dynamic latitude;
  final dynamic longitude;
  final String? status;
  final String? jenisShift;

  const Parampresensi({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.jenisKaryawan,
    this.fkCabang,
    this.fkLevelJabatan,
    this.awalAbsenMasuk,
    this.jamMasuk,
    this.maksTelat,
    this.jamPulang,
    this.latitude,
    this.longitude,
    this.status,
    this.jenisShift,
  });

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        jenisKaryawan,
        fkCabang,
        fkLevelJabatan,
        awalAbsenMasuk,
        jamMasuk,
        maksTelat,
        jamPulang,
        latitude,
        longitude,
        status,
        jenisShift,
      ];

  factory Parampresensi.fromJson(Map<String, dynamic> json) => Parampresensi(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        jenisKaryawan: json["jenis_karyawan"],
        fkCabang: json["fk_cabang"],
        fkLevelJabatan: json["fk_level_jabatan"],
        awalAbsenMasuk: json["awal_absen_masuk"],
        jamMasuk: json["jam_masuk"],
        maksTelat: json["maks_telat"],
        jamPulang: json["jam_pulang"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        status: json["status"],
        jenisShift: json["jenis_shift"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "jenis_karyawan": jenisKaryawan,
        "fk_cabang": fkCabang,
        "fk_level_jabatan": fkLevelJabatan,
        "awal_absen_masuk": awalAbsenMasuk,
        "jam_masuk": jamMasuk,
        "maks_telat": maksTelat,
        "jam_pulang": jamPulang,
        "latitude": latitude,
        "longitude": longitude,
        "status": status,
        "jenis_shift": jenisShift,
      };
}
