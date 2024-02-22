// To parse this JSON data, do
//
//     final logAttendance = logAttendanceFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

LogAttendance logAttendanceFromJson(String str) =>
    LogAttendance.fromJson(json.decode(str));

String logAttendanceToJson(LogAttendance data) => json.encode(data.toJson());

List<LogAttendance> listLogAttendanceFromJson(String str) =>
    List<LogAttendance>.from(
        json.decode(str).map((x) => LogAttendance.fromJson(x)));

String listLogAttendanceToJson(List<LogAttendance> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LogAttendance extends Equatable {
  final int? periodeNo;
  final String? periode;
  final String? periodeNama;
  final int? noClockOut;
  final List<Presensi>? presensi;

  const LogAttendance({
    this.periodeNo,
    this.periode,
    this.periodeNama,
    this.noClockOut,
    this.presensi,
  });

  @override
  List<Object?> get props => [
        periodeNo,
        periode,
        periodeNama,
        noClockOut,
        presensi,
      ];

  factory LogAttendance.fromJson(Map<String, dynamic> json) => LogAttendance(
        periodeNo: json["periode_no"],
        periode: json["periode"],
        periodeNama: json["periode_nama"],
        noClockOut: json["no_clockout"],
        presensi: json["presensi"] == null
            ? []
            : List<Presensi>.from(
                json["presensi"]!.map((x) => Presensi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "periode_no": periodeNo,
        "periode": periode,
        "periode_nama": periodeNama,
        "no_clockout": noClockOut,
        "presensi": presensi == null
            ? []
            : List<dynamic>.from(presensi!.map((x) => x.toJson())),
      };
}

class Presensi extends Equatable {
  final DateTime? tanggal;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? jamMasuk;
  final DateTime? jamPulang;
  final String? imageMasuk;
  final String? imagePulang;
  final String? keterangan;
  final String? presensiStatus;
  final dynamic presensiStatusPulang;
  final dynamic fkOvertime;
  final dynamic fkTimeoff;

  const Presensi({
    this.tanggal,
    this.createdAt,
    this.updatedAt,
    this.jamMasuk,
    this.jamPulang,
    this.imageMasuk,
    this.imagePulang,
    this.keterangan,
    this.presensiStatus,
    this.presensiStatusPulang,
    this.fkOvertime,
    this.fkTimeoff,
  });

  @override
  List<Object?> get props => [
        tanggal,
        createdAt,
        updatedAt,
        jamMasuk,
        jamPulang,
        imageMasuk,
        imagePulang,
        keterangan,
        presensiStatus,
        presensiStatusPulang,
        fkOvertime,
        fkTimeoff,
      ];

  factory Presensi.fromJson(Map<String, dynamic> json) => Presensi(
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        jamMasuk: json["jam_masuk"] == null
            ? null
            : DateTime.parse(json["jam_masuk"]),
        jamPulang: json["jam_pulang"] == null
            ? null
            : DateTime.parse(json["jam_pulang"]),
        imageMasuk: json["image_masuk"],
        imagePulang: json["image_pulang"],
        keterangan: json["keterangan"],
        presensiStatus: json["presensi_status"],
        presensiStatusPulang: json["presensi_status_pulang"],
        fkOvertime: json["fk_overtime"],
        fkTimeoff: json["fk_timeoff"],
      );

  Map<String, dynamic> toJson() => {
        "tanggal":
            "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "jam_masuk": jamMasuk?.toIso8601String(),
        "jam_pulang": jamPulang?.toIso8601String(),
        "image_masuk": imageMasuk,
        "image_pulang": imagePulang,
        "keterangan": keterangan,
        "presensi_status": presensiStatus,
        "presensi_status_pulang": presensiStatusPulang,
        "fk_overtime": fkOvertime,
        "fk_timeoff": fkTimeoff,
      };
}
