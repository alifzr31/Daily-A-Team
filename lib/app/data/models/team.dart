// To parse this JSON data, do
//
//     final team = teamFromJson(jsonString);

import 'dart:convert';

import 'package:dailyateam/app/data/models/karyawan.dart';
import 'package:equatable/equatable.dart';

Team teamFromJson(String str) => Team.fromJson(json.decode(str));

String teamToJson(Team data) => json.encode(data.toJson());

List<Team> listTeamFromJson(String str) =>
    List<Team>.from(json.decode(str).map((x) => Team.fromJson(x)));

String listTeamToJson(List<Team> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Team extends Equatable {
  final int? id;
  final DateTime? tanggal;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? jamMasuk;
  final DateTime? jamPulang;
  final String? imageMasuk;
  final dynamic imagePulang;
  final String? latitude;
  final String? longitude;
  final String? keterangan;
  final int? idKaryawan;
  final int? idUser;
  final dynamic latitudePulang;
  final dynamic longitudePulang;
  final int? idParampresensi;
  final String? presensiStatus;
  final dynamic istirahatKeluar;
  final dynamic istirahatMasuk;
  final Karyawan? karyawan;

  const Team({
    this.id,
    this.tanggal,
    this.createdAt,
    this.updatedAt,
    this.jamMasuk,
    this.jamPulang,
    this.imageMasuk,
    this.imagePulang,
    this.latitude,
    this.longitude,
    this.keterangan,
    this.idKaryawan,
    this.idUser,
    this.latitudePulang,
    this.longitudePulang,
    this.idParampresensi,
    this.presensiStatus,
    this.istirahatKeluar,
    this.istirahatMasuk,
    this.karyawan,
  });

  @override
  List<Object?> get props => [
        id,
        tanggal,
        createdAt,
        updatedAt,
        jamMasuk,
        jamPulang,
        imageMasuk,
        imagePulang,
        latitude,
        longitude,
        keterangan,
        idKaryawan,
        idUser,
        latitudePulang,
        longitudePulang,
        idParampresensi,
        presensiStatus,
        istirahatKeluar,
        istirahatMasuk,
        karyawan,
      ];

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
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
        latitude: json["latitude"],
        longitude: json["longitude"],
        keterangan: json["keterangan"],
        idKaryawan: json["id_karyawan"],
        idUser: json["id_user"],
        latitudePulang: json["latitude_pulang"],
        longitudePulang: json["longitude_pulang"],
        idParampresensi: json["id_parampresensi"],
        presensiStatus: json["presensi_status"],
        istirahatKeluar: json["istirahat_keluar"],
        istirahatMasuk: json["istirahat_masuk"],
        karyawan: json["preskaryawan"] == null
            ? null
            : Karyawan.fromJson(json["preskaryawan"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal":
            "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "jam_masuk": jamMasuk?.toIso8601String(),
        "jam_pulang": jamPulang?.toIso8601String(),
        "image_masuk": imageMasuk,
        "image_pulang": imagePulang,
        "latitude": latitude,
        "longitude": longitude,
        "keterangan": keterangan,
        "id_karyawan": idKaryawan,
        "id_user": idUser,
        "latitude_pulang": latitudePulang,
        "longitude_pulang": longitudePulang,
        "id_parampresensi": idParampresensi,
        "presensi_status": presensiStatus,
        "istirahat_keluar": istirahatKeluar,
        "istirahat_masuk": istirahatMasuk,
        "preskaryawan": karyawan?.toJson(),
      };
}
