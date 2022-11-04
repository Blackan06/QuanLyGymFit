import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import './user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';
import 'buoitap.dart';

class Users with ChangeNotifier {
  final HttpClient = http.Client();

  List<User> _itemsUser = [];

  List<User> get itemsUser {
    return [..._itemsUser];
  }

  User findbyId(int id) {
    return _itemsUser.firstWhere((element) => element.id == id);
  }

  User findbyName(String name) {
    return _itemsUser.firstWhere((element) => element.Name == name);
  }

  // Future<User> find(int id) async {
  //   var response = await http.get("${BASE_URL}/findall");
  // }
  Future<List<User>?> getDataUser() async {
    var client = http.Client();
    var uri = Uri.parse('https://6361d18afabb6460d8ff5276.mockapi.io/user');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }

  Map<String, dynamic>? customHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json;charset=UTF-8"
  };
  bool loading = false;
  bool isBack = false;
  Future<void> addData(User user) async {
    loading = true;
    notifyListeners();
    var client = http.Client();
    var uri = Uri.parse('https://6361d18afabb6460d8ff5276.mockapi.io/user');
    var s = user.toJson();
    var studentbody = json.encode(s);

    var response = await client.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: studentbody);
    if (response.statusCode == 200) {
      isBack = true;
    }
    loading = false;
    notifyListeners();
  }

  Future<void> addUser(User user) async {
    const url = 'https://6361d18afabb6460d8ff5276.mockapi.io/user';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'id': user.id,
          'name': user.Name,
          'phone': user.Phone,
          'dateofbirth': user.DateOfBirth.toString(),
          'pacakage': user.package,
          // 'email': user.Email,
          // 'password': user.Password,
          // 'target': user.Target,
          // 'height': user.Height,
          // 'weight': user.Weight,
        }),
      );
      final newUser = User(
        Name: user.Name,
        Phone: user.Phone,
        DateOfBirth: user.DateOfBirth,
        package: user.package,
        // Email: user.Email,
        // Password: user.Password,
        // Target: user.Target,
        // Address: user.Address,
        // Height: user.Height,
        // Weight: user.Weight,
        id: user.id,
      );
      _itemsUser.add(newUser);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> fetchAndSetUser() async {
    const url = 'https://6361d18afabb6460d8ff5276.mockapi.io/user';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<int, dynamic>;
      if (extractedData == null) {
        return;
      }
      final List<User> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(User(
            id: prodId,
            Name: prodData['name'],
            Phone: prodData['phone'],
            DateOfBirth: prodData['dateofbirth'],
            package: prodData['package']));
      });
      _itemsUser = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> updateUser(int id, User user) async {
    final prodIndex = _itemsUser.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url =
          'https://shop-65063-default-rtdb.firebaseio.com/user/$id.json';
      await http.patch(Uri.parse(url),
          body: json.encode({
            'name': user.Name,
            'phone': user.Phone,
            'dateofbirth': user.DateOfBirth.toString(),
          }));
      _itemsUser[prodIndex] = user;
      notifyListeners();
    } else {
      print('...');
    }
  }
}
