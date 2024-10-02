import 'package:bloc_prcatice/api_integration_bloc_freezed_clean_arch/domain/entities/todo.dart';
import 'package:bloc_prcatice/api_integration_bloc_freezed_clean_arch/domain/repositories/todo_repository.dart';

class FetchTodos {
  final TodoRepository repository;

  FetchTodos(this.repository);

  Future<List<Todo>> call() async {
    return await repository.getTodos();
  }
}
