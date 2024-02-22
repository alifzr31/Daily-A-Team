// To parse this JSON data, do
//
//     final announcement = announcementFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Announcement announcementFromJson(String str) =>
    Announcement.fromJson(json.decode(str));

String announcementToJson(Announcement data) => json.encode(data.toJson());

List<Announcement> listAnnouncementFromJson(String str) =>
    List<Announcement>.from(
        json.decode(str).map((x) => Announcement.fromJson(x)));

String listAnnouncementToJson(List<Announcement> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Announcement extends Equatable {
  final int? id;
  final String? judul;
  final String? isi;
  final DateTime? tanggal;
  final dynamic dokumen;
  final String? status;
  final int? idUser;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Announcement({
    this.id,
    this.judul,
    this.isi,
    this.tanggal,
    this.dokumen,
    this.status,
    this.idUser,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        judul,
        isi,
        tanggal,
        dokumen,
        status,
        idUser,
        createdAt,
        updatedAt,
      ];

  factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
        id: json["id"],
        judul: json["judul"],
        isi: json["isi"],
        tanggal:
            json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        dokumen: json["dokumen"],
        status: json["status"],
        idUser: json["id_user"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "isi": isi,
        "tanggal":
            "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "dokumen": dokumen,
        "status": status,
        "id_user": idUser,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
