// To parse this JSON data, do
//
//     final logOvertime = logOvertimeFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

LogOvertime logOvertimeFromJson(String str) =>
    LogOvertime.fromJson(json.decode(str));

String logOvertimeToJson(LogOvertime data) => json.encode(data.toJson());

List<LogOvertime> listLogOvertimeFromJson(String str) => List<LogOvertime>.from(
    json.decode(str).map((x) => LogOvertime.fromJson(x)));

String listLogOvertimeToJson(List<LogOvertime> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LogOvertime extends Equatable {
  final int? id;
  final int? idKar;
  final DateTime? tanggal;
  final DateTime? tanggalOvertime;
  final String? mulai;
  final String? akhir;
  final String? durasi;
  final String? statusApprove;
  final String? kompensasi;
  final String? note;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const LogOvertime({
    this.id,
    this.idKar,
    this.tanggal,
    this.tanggalOvertime,
    this.mulai,
    this.akhir,
    this.durasi,
    this.statusApprove,
    this.kompensasi,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        idKar,
        tanggal,
        tanggalOvertime,
        mulai,
        akhir,
        durasi,
        statusApprove,
        kompensasi,
        note,
        createdAt,
        updatedAt,
      ];

  factory LogOvertime.fromJson(Map<String, dynamic> json) => LogOvertime(
        id: json["id"],
        idKar: json["id_kar"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        tanggalOvertime: json["tanggal_overtime"] == null
            ? null
            : DateTime.parse(json["tanggal_overtime"]),
        mulai: json["mulai"],
        akhir: json["akhir"],
        durasi: json["durasi"],
        statusApprove: json["status_approve"],
        kompensasi: json["kompensasi"],
        note: json["note"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_kar": idKar,
        "tanggal":
            "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "tanggal_overtime":
            "${tanggalOvertime!.year.toString().padLeft(4, '0')}-${tanggalOvertime!.month.toString().padLeft(2, '0')}-${tanggalOvertime!.day.toString().padLeft(2, '0')}",
        "mulai": mulai,
        "akhir": akhir,
        "durasi": durasi,
        "status_approve": statusApprove,
        "kompensasi": kompensasi,
        "note": note,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
