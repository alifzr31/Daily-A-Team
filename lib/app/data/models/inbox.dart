// To parse this JSON data, do
//
//     final inbox = inboxFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Inbox inboxFromJson(String str) => Inbox.fromJson(json.decode(str));

String inboxToJson(Inbox data) => json.encode(data.toJson());

List<Inbox> listInboxFromJson(String str) =>
    List<Inbox>.from(json.decode(str).map((x) => Inbox.fromJson(x)));

String listInboxToJson(List<Inbox> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Inbox extends Equatable {
  final int? id;
  final int? pengirimId;
  final int? penerimaId;
  final String? title;
  final String? isiPengirim;
  final String? isiPenerima;
  final String? statusAtasan;
  final String? statusBawahan;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? idTimeOffs;
  final dynamic idPresensiRequests;
  final String? notes;
  final Pen? pengirim;
  final Pen? penerima;

  const Inbox({
    this.id,
    this.pengirimId,
    this.penerimaId,
    this.title,
    this.isiPengirim,
    this.isiPenerima,
    this.statusAtasan,
    this.statusBawahan,
    this.createdAt,
    this.updatedAt,
    this.idTimeOffs,
    this.idPresensiRequests,
    this.notes,
    this.pengirim,
    this.penerima,
  });

  @override
  List<Object?> get props => [
        id,
        pengirimId,
        penerimaId,
        title,
        isiPengirim,
        isiPenerima,
        statusAtasan,
        statusBawahan,
        createdAt,
        updatedAt,
        idTimeOffs,
        idPresensiRequests,
        notes,
        pengirim,
        penerima,
      ];

  factory Inbox.fromJson(Map<String, dynamic> json) => Inbox(
        id: json["id"],
        pengirimId: json["pengirim_id"],
        penerimaId: json["penerima_id"],
        title: json["title"],
        isiPengirim: json["isi_pengirim"],
        isiPenerima: json["isi_penerima"],
        statusAtasan: json["status_atasan"],
        statusBawahan: json["status_bawahan"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        idTimeOffs: json["id_time_offs"],
        idPresensiRequests: json["id_presensi_requests"],
        notes: json["notes"],
        pengirim:
            json["pengirim"] == null ? null : Pen.fromJson(json["pengirim"]),
        penerima:
            json["penerima"] == null ? null : Pen.fromJson(json["penerima"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pengirim_id": pengirimId,
        "penerima_id": penerimaId,
        "title": title,
        "isi_pengirim": isiPengirim,
        "isi_penerima": isiPenerima,
        "status_atasan": statusAtasan,
        "status_bawahan": statusBawahan,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "id_time_offs": idTimeOffs,
        "id_presensi_requests": idPresensiRequests,
        "notes": notes,
        "pengirim": pengirim?.toJson(),
        "penerima": penerima?.toJson(),
      };
}

class Pen extends Equatable {
  final int? id;
  final dynamic photo;
  final String? name;
  final String? email;
  final DateTime? emailVerifiedAt;
  final String? phoneNumber;
  final String? confirmPassword;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? approved;
  final String? statusUser;
  final String? deviceToken;
  final dynamic otp;

  const Pen({
    this.id,
    this.photo,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.phoneNumber,
    this.confirmPassword,
    this.createdAt,
    this.updatedAt,
    this.approved,
    this.statusUser,
    this.deviceToken,
    this.otp,
  });

  @override
  List<Object?> get props => [
        id,
        photo,
        name,
        email,
        emailVerifiedAt,
        phoneNumber,
        confirmPassword,
        createdAt,
        updatedAt,
        approved,
        statusUser,
        deviceToken,
        otp,
      ];

  factory Pen.fromJson(Map<String, dynamic> json) => Pen(
        id: json["id"],
        photo: json["photo"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        phoneNumber: json["phone_number"],
        confirmPassword: json["confirm_password"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        approved: json["approved"],
        statusUser: json["status_user"],
        deviceToken: json["device_token"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo": photo,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "phone_number": phoneNumber,
        "confirm_password": confirmPassword,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "approved": approved,
        "status_user": statusUser,
        "device_token": deviceToken,
        "otp": otp,
      };
}
