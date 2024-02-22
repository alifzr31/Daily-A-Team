// To parse this JSON data, do
//
//     final logChangeShift = logChangeShiftFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

LogChangeShift logChangeShiftFromJson(String str) =>
    LogChangeShift.fromJson(json.decode(str));

String logChangeShiftToJson(LogChangeShift data) => json.encode(data.toJson());

List<LogChangeShift> listLogChangeShiftFromJson(String str) =>
    List<LogChangeShift>.from(
        json.decode(str).map((x) => LogChangeShift.fromJson(x)));

String listLogChangeShiftToJson(List<LogChangeShift> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LogChangeShift extends Equatable {
  final int? id;
  final String? shiftAwal;
  final DateTime? tanggalAwal;
  final String? shiftAkhir;
  final DateTime? tanggalAkhir;
  final int? idKaryawan;
  final String? keterangan;
  final String? statusApprove;
  final DateTime? tanggalApprove;
  final String? notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? tanggalOff;
  final String? shiftOff;

  const LogChangeShift({
    this.id,
    this.shiftAwal,
    this.tanggalAwal,
    this.shiftAkhir,
    this.tanggalAkhir,
    this.idKaryawan,
    this.keterangan,
    this.statusApprove,
    this.tanggalApprove,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.tanggalOff,
    this.shiftOff,
  });

  @override
  List<Object?> get props => [
        id,
        shiftAwal,
        tanggalAwal,
        shiftAkhir,
        tanggalAkhir,
        idKaryawan,
        keterangan,
        statusApprove,
        tanggalApprove,
        notes,
        createdAt,
        updatedAt,
        tanggalOff,
        shiftOff,
      ];

  factory LogChangeShift.fromJson(Map<String, dynamic> json) => LogChangeShift(
        id: json["id"],
        shiftAwal: json["shift_awal"],
        tanggalAwal: json["tanggal_awal"] == null
            ? null
            : DateTime.parse(json["tanggal_awal"]),
        shiftAkhir: json["shift_akhir"],
        tanggalAkhir: json["tanggal_akhir"] == null
            ? null
            : DateTime.parse(json["tanggal_akhir"]),
        idKaryawan: json["id_karyawan"],
        keterangan: json["keterangan"],
        statusApprove: json["status_approve"],
        tanggalApprove: json["tanggal_approve"] == null
            ? null
            : DateTime.parse(json["tanggal_approve"]),
        notes: json["notes"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        tanggalOff: json["tanggal_off"] == null
            ? null
            : DateTime.parse(json["tanggal_off"]),
        shiftOff: json["shift_off"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shift_awal": shiftAwal,
        "tanggal_awal":
            "${tanggalAwal!.year.toString().padLeft(4, '0')}-${tanggalAwal!.month.toString().padLeft(2, '0')}-${tanggalAwal!.day.toString().padLeft(2, '0')}",
        "shift_akhir": shiftAkhir,
        "tanggal_akhir":
            "${tanggalAkhir!.year.toString().padLeft(4, '0')}-${tanggalAkhir!.month.toString().padLeft(2, '0')}-${tanggalAkhir!.day.toString().padLeft(2, '0')}",
        "id_karyawan": idKaryawan,
        "keterangan": keterangan,
        "status_approve": statusApprove,
        "tanggal_approve":
            "${tanggalApprove!.year.toString().padLeft(4, '0')}-${tanggalApprove!.month.toString().padLeft(2, '0')}-${tanggalApprove!.day.toString().padLeft(2, '0')}",
        "notes": notes,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "tanggal_off":
            "${tanggalOff!.year.toString().padLeft(4, '0')}-${tanggalOff!.month.toString().padLeft(2, '0')}-${tanggalOff!.day.toString().padLeft(2, '0')}",
        "shift_off": shiftOff,
      };
}
