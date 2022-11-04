import 'package:gym_fit/providers/user.dart';

class BuoiTap {
  final int id;
  final String name;
  final String diadiem;
  final String tenPt;
  final int slot;
  final String phong;
  DateTime thoigian;

  BuoiTap({
    required this.id,
    required this.diadiem,
    required this.tenPt,
    required this.phong,
    required this.slot,
    required this.thoigian,
    required this.name,
  });

  factory BuoiTap.fromJson(Map<String, dynamic> json) {
    return BuoiTap(
      id: json['id'] ?? "",
      name: json['namegoitap'] ?? "",
      diadiem: json['diadiem'] ?? "",
      tenPt: json['tenpt'] ?? "",
      slot: json['slot'] ?? "",
      phong: json['phong'] ?? "",
      thoigian: json['thoigian'] ?? "",
    );
  }
}
