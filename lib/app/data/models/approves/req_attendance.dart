// To parse this JSON data, do
//
//     final reqAttendance = reqAttendanceFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

ReqAttendance reqAttendanceFromJson(String str) =>
    ReqAttendance.fromJson(json.decode(str));

String reqAttendanceToJson(ReqAttendance data) => json.encode(data.toJson());

List<ReqAttendance> listReqAttendanceFromJson(String str) =>
    List<ReqAttendance>.from(
        json.decode(str).map((x) => ReqAttendance.fromJson(x)));

String listReqAttendanceToJson(List<ReqAttendance> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReqAttendance extends Equatable {
  final String? namaLengkap;
  final String? nomorIndukKaryawan;
  final int? id;
  final DateTime? tanggal;
  final String? statusApprove;
  final String? notes;
  final String? jam;
  final String? jenis;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ReqAttendance({
    this.namaLengkap,
    this.nomorIndukKaryawan,
    this.id,
    this.tanggal,
    this.statusApprove,
    this.notes,
    this.jam,
    this.jenis,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        namaLengkap,
        nomorIndukKaryawan,
        id,
        tanggal,
        statusApprove,
        notes,
        jam,
        jenis,
        createdAt,
        updatedAt,
      ];

  factory ReqAttendance.fromJson(Map<String, dynamic> json) => ReqAttendance(
        namaLengkap: json["nama_lengkap"],
        nomorIndukKaryawan: json["nomor_induk_karyawan"],
        id: json["id"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        statusApprove: json["status_approve"],
        notes: json["notes"],
        jam: json["jam"],
        jenis: json["jenis"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "nama_lengkap": namaLengkap,
        "nomor_induk_karyawan": nomorIndukKaryawan,
        "id": id,
        "tanggal":
            "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "status_approve": statusApprove,
        "notes": notes,
        "jam": jam,
        "jenis": jenis,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
