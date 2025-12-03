import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:session/user_model.dart';

class ApiService {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<UserModel>> fetchUsers() async {
    final uri = Uri.parse('$_baseUrl/users');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body) as List;
      print(response.body.toString());
      return data.map((e) => UserModel.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load users: ${response.statusCode}');
    }
  }

  Future<List<UserModel>> fetchAdmin() async {
    final uri = Uri.parse('$_baseUrl/users');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body) as List;
      print(response.body.toString());
      return data.map((e) => UserModel.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load users: ${response.statusCode}');
    }
  }
}