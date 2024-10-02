import 'package:bloc_prcatice/api_integration_bloc_freezed_clean_arch/domain/entities/todo.dart';
import 'package:bloc_prcatice/api_integration_bloc_freezed_clean_arch/domain/usecases/fetch_todos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_bloc.freezed.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final FetchTodos fetchTodos;

  TodoBloc({required this.fetchTodos}) : super(TodoInitial()) {
    on<FetchTodosEvent>(_onFetchTodos);
  }

  Future<void> _onFetchTodos(
      FetchTodosEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      final todos = await fetchTodos();
      emit(TodoLoaded(todos: todos));
    } catch (e) {
      emit(TodoError(message: e.toString()));
    }
  }
}
