import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gym_fit/providers/thucan.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';
import '../services/thucan_service.dart';
import 'package:intl/intl.dart';

class FoodToday extends ChangeNotifier {
  final httpClient = http.Client();
  final _serviceThucAn = ThucAnService();
  DateFormat dateFormat = DateFormat("hh:mm:ss");
  bool isLoading = false;
  List<ThucAn> _itemsThucan = [];

  List<ThucAn> get itemsThucan => _itemsThucan;

  ThucAn findbyId(String id) {
    return _itemsThucan.firstWhere((element) => element.id == id);
  }

  Future<void> getAllDataThucAn() async {
    isLoading = true;
    notifyListeners();

    final response = await _serviceThucAn.getAll();
    _itemsThucan = response;
    isLoading = false;

    notifyListeners();
  }

  Map<String, String>? customHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json;charset=UTF-8"
  };

  // Future<void> fetchAndSetProducts() async {
  //   const url = 'https://6361d18afabb6460d8ff5276.mockapi.io/thucan';
  //   try {
  //     isLoading = true;

  //     notifyListeners();
  //     final response = await http.get(Uri.parse(url));
  //     final extractedData = json.decode(response.body);
  //     if (extractedData == null) {
  //       return;
  //     }
  //     final List<ThucAn> loadedProducts = [];
  //     extractedData.forEach((prodId, prodData) {
  //       loadedProducts.add(ThucAn(
  //         id: prodId,
  //         name: prodData['name'],
  //         soLuong: prodData['soluong'],
  //         time: DateTime.parse(prodData['time'] as String),
  //       ));
  //     });

  //     _itemsThucan = loadedProducts;
  //     isLoading = false;

  //     notifyListeners();
  //   } catch (error) {
  //     throw (error);
  //   }
  // }

  Future<void> addThucAn(ThucAn thucAnHangNgay) async {
    const url = 'https://6361d18afabb6460d8ff5276.mockapi.io/thucan';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'name': thucAnHangNgay.name,
          'soluong': thucAnHangNgay.soLuong,
          // 'time': thucAnHangNgay.time.toString(),
        }),
      );
      final newThucAn = ThucAn(
        name: thucAnHangNgay.name,
        soLuong: thucAnHangNgay.soLuong,
        time: thucAnHangNgay.time,
        id: json.decode(response.body)['name'],
      );
      _itemsThucan.add(newThucAn);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateThucAn(String id, ThucAn newProduct) async {
    final prodIndex = _itemsThucan.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = 'https://6361d18afabb6460d8ff5276.mockapi.io/thucan/$id';
      await http.patch(Uri.parse(url),
          body: json.encode({
            'name': newProduct.name,
            'soluong': newProduct.soLuong,
            // 'time': newProduct.time,
          }));
      _itemsThucan[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> deleteThucAn(String id) async {
    final url = 'https://6361d18afabb6460d8ff5276.mockapi.io/thucan/$id';
    final existingProductIndex =
        _itemsThucan.indexWhere((prod) => prod.id == id);
    ThucAn? existingProduct = _itemsThucan[existingProductIndex];
    _itemsThucan.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode >= 400) {
      _itemsThucan.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
  }

  String dateTimeTextFormat(String text) {
    String formatedText = '';
    DateTime dateTime = DateTime.parse(text);
    formatedText = DateFormat("yyyy-MM-dd hh:mm aaa").format(dateTime);
    return formatedText;
  }
}
