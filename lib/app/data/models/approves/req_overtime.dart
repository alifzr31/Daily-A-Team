// To parse this JSON data, do
//
//     final reqOvertime = reqOvertimeFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

ReqOvertime reqOvertimeFromJson(String str) =>
    ReqOvertime.fromJson(json.decode(str));

String reqOvertimeToJson(ReqOvertime data) => json.encode(data.toJson());

List<ReqOvertime> listReqOvertimeFromJson(String str) => List<ReqOvertime>.from(
    json.decode(str).map((x) => ReqOvertime.fromJson(x)));

String listReqOvertimeToJson(List<ReqOvertime> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReqOvertime extends Equatable {
  final int? id;
  final DateTime? tanggal;
  final DateTime? tanggalOvertime;
  final String? durasi;
  final String? statusApprove;
  final String? kompensasi;
  final String? note;
  final int? idKar;
  final Getkar? getkar;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ReqOvertime({
    this.id,
    this.tanggal,
    this.tanggalOvertime,
    this.durasi,
    this.statusApprove,
    this.kompensasi,
    this.note,
    this.idKar,
    this.getkar,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        tanggal,
        tanggalOvertime,
        durasi,
        statusApprove,
        kompensasi,
        note,
        idKar,
        getkar,
        createdAt,
        updatedAt,
      ];

  factory ReqOvertime.fromJson(Map<String, dynamic> json) => ReqOvertime(
        id: json["id"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        tanggalOvertime: json["tanggal_overtime"] == null
            ? null
            : DateTime.parse(json["tanggal_overtime"]),
        durasi: json["durasi"],
        statusApprove: json["status_approve"],
        kompensasi: json["kompensasi"],
        note: json["note"],
        idKar: json["id_kar"],
        getkar: json["getkar"] == null ? null : Getkar.fromJson(json["getkar"]),
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
        "tanggal_overtime":
            "${tanggalOvertime!.year.toString().padLeft(4, '0')}-${tanggalOvertime!.month.toString().padLeft(2, '0')}-${tanggalOvertime!.day.toString().padLeft(2, '0')}",
        "durasi": durasi,
        "status_approve": statusApprove,
        "kompensasi": kompensasi,
        "note": note,
        "id_kar": idKar,
        "getkar": getkar?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Getkar extends Equatable {
  final int? id;
  final String? namaLengkap;
  final int? fkCabang;
  final Cabang? cabang;

  const Getkar({
    this.id,
    this.namaLengkap,
    this.fkCabang,
    this.cabang,
  });

  @override
  List<Object?> get props => [
        id,
        namaLengkap,
        fkCabang,
        cabang,
      ];

  factory Getkar.fromJson(Map<String, dynamic> json) => Getkar(
        id: json["id"],
        namaLengkap: json["nama_lengkap"],
        fkCabang: json["fk_cabang"],
        cabang: json["cabang"] == null ? null : Cabang.fromJson(json["cabang"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_lengkap": namaLengkap,
        "fk_cabang": fkCabang,
        "cabang": cabang?.toJson(),
      };
}

class Cabang extends Equatable {
  final int? id;
  final String? nama;

  const Cabang({
    this.id,
    this.nama,
  });

  @override
  List<Object?> get props => [
        id,
        nama,
      ];

  factory Cabang.fromJson(Map<String, dynamic> json) => Cabang(
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
      };
}
