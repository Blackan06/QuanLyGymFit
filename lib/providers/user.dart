import 'dart:convert';

import 'package:gym_fit/providers/buoitap.dart';

List<User> postFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
String userToJson(List<User> user) =>
    json.encode(List<dynamic>.from(user.map((e) => e.toJson())));

class User {
  final int id;
  final String Name;
  final int Phone;
  // String Email;
  // String Password;
  // String Address;
  // String Target;
  // double? Weight;
  // double? Height;
  final DateTime? DateOfBirth;
  final BuoiTap? package;

  User({
    required this.id,
    required this.Name,
    required this.Phone,
    // required this.Email,
    // required this.Password,
    // required this.Address,
    // required this.Target,
    // required this.Weight,
    // required this.Height,
    required this.package,
    required this.DateOfBirth,
  });
  int get _id => id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        Name: json["name"],
        DateOfBirth: json["dateofbirth"],
        package: BuoiTap.fromJson(json["packageid"]),
        Phone: json["phone"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": Name,
        "phone": Phone,
        "package": package,
        "dateofbirth": DateOfBirth,
      };
}
