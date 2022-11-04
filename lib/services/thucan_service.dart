import 'dart:convert';

import '../providers/thucan.dart';
import 'package:http/http.dart' as http;

class ThucAnService {
  Future<List<ThucAn>> getAll() async {
    const url = 'https://6361d18afabb6460d8ff5276.mockapi.io/thucan';
    final uri = Uri.parse(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final thucans = json.map((e) {
        return ThucAn(
            id: e['id'],
            name: e['name'],
            soLuong: e['soluong'],
            time: e['time']);
      }).toList();
      return thucans;
    }
    throw 'error';
  }
}
