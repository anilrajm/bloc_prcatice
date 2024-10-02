// import 'dart:convert';
//
// import 'package:bloc_prcatice/api_integration_bloc_freezed_clean_arch/data/models/todo_model.dart';
// import 'package:http/http.dart' as http;
//
// class TodoRemoteDataSource {
//   // final String apiUrl = 'https://jsonplaceholder.typicode.com/todos';
//   //
//   // Future<List<TodoModel>> fetchTodos() async {
//   //   final response = await http.get(Uri.parse(apiUrl));
//   //   if (response.statusCode == 200) {
//   //     final List<dynamic> todoJson = json.decode(response.body);
//   //     return todoJson.map((json) => TodoModel.fromJson(json)).toList();
//   //   } else {
//   //     throw Exception('Failed to load todos');
//   //   }
//   // }
// }
import 'dart:convert';

import 'package:bloc_prcatice/api_integration_bloc_freezed_clean_arch/data/models/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoRemoteDataSource {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<TodoModel>> fetchTodos() async {
    int retryCount = 3;
    while (retryCount > 0) {
      try {
        final response = await http.get(Uri.parse(apiUrl));
        if (response.statusCode == 200) {
          final List<dynamic> todoJson = json.decode(response.body);
          return todoJson.map((json) => TodoModel.fromJson(json)).toList();
        } else {
          throw Exception('Failed to load todos');
        }
      } catch (e) {
        retryCount--;
        if (retryCount == 0) {
          rethrow;
        }
      }
    }
    throw Exception('Failed to load todos after retries');
  }
}
