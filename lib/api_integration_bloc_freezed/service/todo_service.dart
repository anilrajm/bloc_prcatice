// lib/api_service.dart
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/todo_model.dart';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<List<Todo>> fetchTodos() async {
    final response = await http.get(Uri.parse('$baseUrl/todos'));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((e) => Todo.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
