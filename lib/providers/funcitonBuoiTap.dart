// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:gym_fit/providers/buoitap.dart';
// import 'package:http/http.dart' as http;

// class BuoiTaps extends ChangeNotifier {
//   final HttpClient = http.Client();
//   bool loading = false;
//   late BuoiTap result;
//   List<BuoiTap> _itemsUser = [];

//   List<BuoiTap> get itemsUser {
//     return [..._itemsUser];
//   }

//   BuoiTap findbyId(int id) {
//     return _itemsUser.firstWhere((element) => element.id == id);
//   }

//   BuoiTap findbyName(int userId) {
//     return _itemsUser.firstWhere((element) => element.user?.id == userId);
//   }

//   Future<BuoiTap?> getSinglePostData(int id) async {
//     BuoiTap? buoiTap;
//     buoiTap = findbyName(id);
//     try {
//       final response = await http.get(
//         Uri.parse(
//             "https://6361d18afabb6460d8ff5276.mockapi.io/buoitap/${result?.id}"),
//         headers: {
//           HttpHeaders.contentTypeHeader: "application/json",
//         },
//       );
//       if (response.statusCode == 200) {
//         final item = json.decode(response.body);
//         result = BuoiTap.fromJson(item);
//       } else {
//         print("error");
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//     return result;
//   }

//   getPostData(int name) async {
//     loading = true;
//     result = (await getSinglePostData(name))!;
//     _itemsUser = result as List<BuoiTap>;
//     loading = false;

//     notifyListeners();
//   }
// }
