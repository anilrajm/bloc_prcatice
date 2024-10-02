import 'package:bloc/bloc.dart';
import 'package:bloc_prcatice/api_integration_bloc_freezed/service/todo_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/todo_model.dart';

part 'todo_bloc.freezed.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final ApiService apiService;

  TodoBloc(this.apiService) : super(const TodoState.initial()) {
    on<FetchTodos>((event, emit) async {
      emit(const TodoLoading());

      try {
        final todos = await apiService.fetchTodos();
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });
  }
}
