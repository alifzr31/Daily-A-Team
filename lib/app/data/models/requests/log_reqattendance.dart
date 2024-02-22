// To parse this JSON data, do
//
//     final logReqAttend = logReqAttendFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

LogReqAttendance logReqAttendanceFromJson(String str) =>
    LogReqAttendance.fromJson(json.decode(str));

String logReqAttendanceToJson(LogReqAttendance data) =>
    json.encode(data.toJson());

List<LogReqAttendance> listLogReqAttendanceFromJson(String str) =>
    List<LogReqAttendance>.from(
        json.decode(str).map((x) => LogReqAttendance.fromJson(x)));

String listLogReqAttendanceToJson(List<LogReqAttendance> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LogReqAttendance extends Equatable {
  final int? id;
  final DateTime? tanggal;
  final String? jam;
  final String? jenis;
  final int? idKaryawan;
  final String? statusApprove;
  final dynamic tanggalApprove;
  final String? notes;
  final dynamic userApproveId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const LogReqAttendance({
    this.id,
    this.tanggal,
    this.jam,
    this.jenis,
    this.idKaryawan,
    this.statusApprove,
    this.tanggalApprove,
    this.notes,
    this.userApproveId,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        tanggal,
        jam,
        jenis,
        idKaryawan,
        statusApprove,
        tanggalApprove,
        notes,
        userApproveId,
        createdAt,
        updatedAt,
      ];

  factory LogReqAttendance.fromJson(Map<String, dynamic> json) =>
      LogReqAttendance(
        id: json["id"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        jam: json["jam"],
        jenis: json["jenis"],
        idKaryawan: json["id_karyawan"],
        statusApprove: json["status_approve"],
        tanggalApprove: json["tanggal_approve"],
        notes: json["notes"],
        userApproveId: json["user_approve_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal":
            "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "jam": jam,
        "jenis": jenis,
        "id_karyawan": idKaryawan,
        "status_approve": statusApprove,
        "tanggal_approve": tanggalApprove,
        "notes": notes,
        "user_approve_id": userApproveId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
