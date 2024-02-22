// To parse this JSON data, do
//
//     final breakTime = breakTimeFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

BreakTime breakTimeFromJson(String str) => BreakTime.fromJson(json.decode(str));

String breakTimeToJson(BreakTime data) => json.encode(data.toJson());

List<BreakTime> listBreakTimeFromJson(String str) =>
    List<BreakTime>.from(json.decode(str).map((x) => BreakTime.fromJson(x)));

String listBreakTimeToJson(List<BreakTime> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BreakTime extends Equatable {
  final DateTime? tanggal;
  final String? istirahatKeluar;
  final String? istirahatMasuk;

  const BreakTime({
    this.tanggal,
    this.istirahatKeluar,
    this.istirahatMasuk,
  });

  @override
  List<Object?> get props => [
        tanggal,
        istirahatKeluar,
        istirahatMasuk,
      ];

  factory BreakTime.fromJson(Map<String, dynamic> json) => BreakTime(
        tanggal: DateTime.parse(json["tanggal"]),
        istirahatKeluar: json["istirahat_keluar"],
        istirahatMasuk: json["istirahat_masuk"],
      );

  Map<String, dynamic> toJson() => {
        "tanggal":
            "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "istirahat_keluar": istirahatKeluar,
        "istirahat_masuk": istirahatMasuk,
      };
}
