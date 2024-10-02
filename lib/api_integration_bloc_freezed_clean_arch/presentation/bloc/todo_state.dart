part of 'todo_bloc.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState.initial() = TodoInitial;

  const factory TodoState.loading() = TodoLoading;

  const factory TodoState.loaded({required List<Todo> todos}) = TodoLoaded;

  const factory TodoState.error({required String message}) = TodoError;
}
//
