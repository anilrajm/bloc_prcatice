part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  final int count;

  final bool isSnackBarVisible;

  const CounterState({required this.count, required this.isSnackBarVisible});
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(count: 0, isSnackBarVisible: false);
}

final class CounterUpdated extends CounterState {
  const CounterUpdated(
      {required super.count, required super.isSnackBarVisible});
}
