part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class Increment extends CounterEvent {
  final int userInput;

  Increment({required this.userInput});
}

class Decrement extends CounterEvent {}

class ShowSnackBar extends CounterEvent {}

class Reset extends CounterEvent {}
