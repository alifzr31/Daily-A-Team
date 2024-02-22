// To parse this JSON data, do
//
//     final choiceTimeOff = choiceTimeOffFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

ChoiceTimeOff choiceTimeOffFromJson(String str) =>
    ChoiceTimeOff.fromJson(json.decode(str));

String choiceTimeOffToJson(ChoiceTimeOff data) => json.encode(data.toJson());

List<ChoiceTimeOff> listChoiceTimeOffFromJson(String str) =>
    List<ChoiceTimeOff>.from(
        json.decode(str).map((x) => ChoiceTimeOff.fromJson(x)));

String listChoiceTimeOffToJson(List<ChoiceTimeOff> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChoiceTimeOff extends Equatable {
  final String? type;
  final List<Obj>? obj;

  const ChoiceTimeOff({
    this.type,
    this.obj,
  });

  @override
  List<Object?> get props => [
        type,
        obj,
      ];

  factory ChoiceTimeOff.fromJson(Map<String, dynamic> json) => ChoiceTimeOff(
        type: json["type"],
        obj: json["obj"] == null
            ? []
            : List<Obj>.from(json["obj"]!.map((x) => Obj.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "obj":
            obj == null ? [] : List<dynamic>.from(obj!.map((x) => x.toJson())),
      };
}

class Obj extends Equatable {
  final int? id;
  final String? nama;
  final String? kode;
  final int? durasi;
  final DateTime? efektifDate;
  final DateTime? expireDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? status;
  final String? type;

  const Obj({
    this.id,
    this.nama,
    this.kode,
    this.durasi,
    this.efektifDate,
    this.expireDate,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.type,
  });

  @override
  List<Object?> get props => [
        id,
        nama,
        kode,
        durasi,
        efektifDate,
        expireDate,
        createdAt,
        updatedAt,
        status,
        type,
      ];

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
        id: json["id"],
        nama: json["nama"],
        kode: json["kode"],
        durasi: json["durasi"],
        efektifDate: json["efektif_date"] == null
            ? null
            : DateTime.parse(json["efektif_date"]),
        expireDate: json["expire_date"] == null
            ? null
            : DateTime.parse(json["expire_date"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        status: json["status"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "kode": kode,
        "durasi": durasi,
        "efektif_date":
            "${efektifDate!.year.toString().padLeft(4, '0')}-${efektifDate!.month.toString().padLeft(2, '0')}-${efektifDate!.day.toString().padLeft(2, '0')}",
        "expire_date":
            "${expireDate!.year.toString().padLeft(4, '0')}-${expireDate!.month.toString().padLeft(2, '0')}-${expireDate!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "status": status,
        "type": type,
      };
}
