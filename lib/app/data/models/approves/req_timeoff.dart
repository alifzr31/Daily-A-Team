// To parse this JSON data, do
//
//     final reqTimeOff = reqTimeOffFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

ReqTimeOff reqTimeOffFromJson(String str) =>
    ReqTimeOff.fromJson(json.decode(str));

String reqTimeOffToJson(ReqTimeOff data) => json.encode(data.toJson());

List<ReqTimeOff> listReqTimeOffFromJson(String str) =>
    List<ReqTimeOff>.from(json.decode(str).map((x) => ReqTimeOff.fromJson(x)));

String listReqTimeOffToJson(List<ReqTimeOff> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReqTimeOff extends Equatable {
  final String? namaLengkap;
  final int? id;
  final DateTime? tanggal;
  final String? statusoff;
  final String? statusApprove;
  final String? dokumen;
  final String? notesAju;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ReqTimeOff({
    this.namaLengkap,
    this.id,
    this.tanggal,
    this.statusoff,
    this.statusApprove,
    this.dokumen,
    this.notesAju,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        namaLengkap,
        id,
        tanggal,
        statusoff,
        statusApprove,
        dokumen,
        notesAju,
        createdAt,
        updatedAt,
      ];

  factory ReqTimeOff.fromJson(Map<String, dynamic> json) => ReqTimeOff(
        namaLengkap: json["nama_lengkap"],
        id: json["id"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        statusoff: json["statusoff"],
        statusApprove: json["status_approve"],
        dokumen: json["dokumen"],
        notesAju: json["notes_aju"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "nama_lengkap": namaLengkap,
        "id": id,
        "tanggal":
            "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "statusoff": statusoff,
        "status_approve": statusApprove,
        "dokumen": dokumen,
        "notes_aju": notesAju,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
