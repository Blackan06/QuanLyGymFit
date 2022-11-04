import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<ThucAn> dataThucAnFromJson(String str) =>
    List<ThucAn>.from(json.decode(str));
String dataThucAnToJson(ThucAn data) => json.encode(data.toJson());

class ThucAn {
  final String id;
  final String name;
  final int soLuong;
  int? time;
  // final double? calo;

  ThucAn({
    required this.id,
    required this.name,
    required this.soLuong,
    required this.time,
    // required this.calo,
  });

  factory ThucAn.fromJson(Map<String, dynamic> json) => ThucAn(
        id: json["id"],
        name: json["name"],
        // calo: json["calo"] ?? "",
        soLuong: json["soluong"] ?? "",
        time: json["time"] ?? "",
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        'soluong': soLuong,
        'time': time,
      };
}
