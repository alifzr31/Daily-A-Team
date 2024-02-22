// To parse this JSON data, do
//
//     final logTimeOff = logTimeOffFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

LogTimeOff logTimeOffFromJson(String str) =>
    LogTimeOff.fromJson(json.decode(str));

String logTimeOffToJson(LogTimeOff data) => json.encode(data.toJson());

List<LogTimeOff> listLogTimeOffFromJson(String str) =>
    List<LogTimeOff>.from(json.decode(str).map((x) => LogTimeOff.fromJson(x)));

String listLogTimeOffToJson(List<LogTimeOff> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LogTimeOff extends Equatable {
  final int? id;
  final DateTime? tanggal;
  final String? statusoff;
  final String? dokumen;
  final String? statusApprove;
  final int? idKaryawan;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? notes;
  final dynamic tanggalApprove;
  final int? fkParam;
  final String? notesAju;

  const LogTimeOff({
    this.id,
    this.tanggal,
    this.statusoff,
    this.dokumen,
    this.statusApprove,
    this.idKaryawan,
    this.createdAt,
    this.updatedAt,
    this.notes,
    this.tanggalApprove,
    this.fkParam,
    this.notesAju,
  });

  @override
  List<Object?> get props => [
        id,
        tanggal,
        statusoff,
        dokumen,
        statusApprove,
        idKaryawan,
        createdAt,
        updatedAt,
        notes,
        tanggalApprove,
        fkParam,
        notesAju,
      ];

  factory LogTimeOff.fromJson(Map<String, dynamic> json) => LogTimeOff(
        id: json["id"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        statusoff: json["statusoff"],
        dokumen: json["dokumen"],
        statusApprove: json["status_approve"],
        idKaryawan: json["id_karyawan"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        notes: json["notes"],
        tanggalApprove: json["tanggal_approve"],
        fkParam: json["fk_param"],
        notesAju: json["notes_aju"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal":
            "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "statusoff": statusoff,
        "dokumen": dokumen,
        "status_approve": statusApprove,
        "id_karyawan": idKaryawan,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "notes": notes,
        "tanggal_approve": tanggalApprove,
        "fk_param": fkParam,
        "notes_aju": notesAju,
      };
}
