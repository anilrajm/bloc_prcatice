import 'package:bloc_prcatice/api_integration_bloc_freezed_clean_arch/data/datasources/remote_data_source.dart';
import 'package:bloc_prcatice/api_integration_bloc_freezed_clean_arch/domain/entities/todo.dart';
import 'package:bloc_prcatice/api_integration_bloc_freezed_clean_arch/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;

  TodoRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    return await remoteDataSource.fetchTodos();
  }
}
