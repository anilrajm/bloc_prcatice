import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@Freezed(copyWith: false)
interface class Todo with _$Todo {
  const factory Todo({
    required int id,
    required String title,
  }) = _Todo;
}
