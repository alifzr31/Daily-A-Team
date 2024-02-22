// To parse this JSON data, do
//
//     final office = officeFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Office officeFromJson(String str) => Office.fromJson(json.decode(str));

String officeToJson(Office data) => json.encode(data.toJson());

List<Office> listOfficeFromJson(String str) =>
    List<Office>.from(json.decode(str).map((x) => Office.fromJson(x)));

String listOfficeToJson(List<Office> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Office extends Equatable {
  final String? jenisShift;
  final int? id;

  const Office({
    this.id,
    this.jenisShift,
  });

  @override
  List<Object?> get props => [
        id,
        jenisShift,
      ];

  factory Office.fromJson(Map<String, dynamic> json) => Office(
        id: json["id"],
        jenisShift: json["jenis_shift"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "jenis_shift": jenisShift,
      };
}
