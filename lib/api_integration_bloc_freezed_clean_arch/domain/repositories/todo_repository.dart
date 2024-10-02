import 'package:bloc_prcatice/api_integration_bloc_freezed_clean_arch/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
}
