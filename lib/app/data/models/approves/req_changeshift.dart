// To parse this JSON data, do
//
//     final reqChangeShift = reqChangeShiftFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

ReqChangeShift reqChangeShiftFromJson(String str) =>
    ReqChangeShift.fromJson(json.decode(str));

String reqChangeShiftToJson(ReqChangeShift data) => json.encode(data.toJson());

List<ReqChangeShift> listReqChangeShiftFromJson(String str) =>
    List<ReqChangeShift>.from(
        json.decode(str).map((x) => ReqChangeShift.fromJson(x)));

String listReqChangeShiftToJson(List<ReqChangeShift> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReqChangeShift extends Equatable {
  final String? namaLengkap;
  final int? idKaryawan;
  final String? nomorIndukKaryawan;
  final int? id;
  final DateTime? tanggalAkhir;
  final String? statusApprove;
  final DateTime? tanggalAwal;
  final String? keterangan;
  final String? shiftAwal;
  final String? shiftAkhir;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ReqChangeShift({
    this.namaLengkap,
    this.idKaryawan,
    this.nomorIndukKaryawan,
    this.id,
    this.tanggalAkhir,
    this.statusApprove,
    this.tanggalAwal,
    this.keterangan,
    this.shiftAwal,
    this.shiftAkhir,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        namaLengkap,
        idKaryawan,
        nomorIndukKaryawan,
        id,
        tanggalAkhir,
        statusApprove,
        tanggalAwal,
        keterangan,
        shiftAwal,
        shiftAkhir,
        createdAt,
        updatedAt,
      ];

  factory ReqChangeShift.fromJson(Map<String, dynamic> json) => ReqChangeShift(
        namaLengkap: json["nama_lengkap"],
        idKaryawan: json["id_karyawan"],
        nomorIndukKaryawan: json["nomor_induk_karyawan"],
        id: json["id"],
        tanggalAkhir: json["tanggal_akhir"] == null
            ? null
            : DateTime.parse(json["tanggal_akhir"]),
        statusApprove: json["status_approve"],
        tanggalAwal: json["tanggal_awal"] == null
            ? null
            : DateTime.parse(json["tanggal_awal"]),
        keterangan: json["keterangan"],
        shiftAwal: json["shift_awal"],
        shiftAkhir: json["shift_akhir"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "nama_lengkap": namaLengkap,
        "id_karyawan": idKaryawan,
        "nomor_induk_karyawan": nomorIndukKaryawan,
        "id": id,
        "tanggal_akhir":
            "${tanggalAkhir!.year.toString().padLeft(4, '0')}-${tanggalAkhir!.month.toString().padLeft(2, '0')}-${tanggalAkhir!.day.toString().padLeft(2, '0')}",
        "status_approve": statusApprove,
        "tanggal_awal":
            "${tanggalAwal!.year.toString().padLeft(4, '0')}-${tanggalAwal!.month.toString().padLeft(2, '0')}-${tanggalAwal!.day.toString().padLeft(2, '0')}",
        "keterangan": keterangan,
        "shift_awal": shiftAwal,
        "shift_akhir": shiftAkhir,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
