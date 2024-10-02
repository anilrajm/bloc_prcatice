part of 'freezed_counter_bloc.dart';

@freezed
class FreezedCounterEvent with _$FreezedCounterEvent {
  const factory FreezedCounterEvent.increment() = Increment;
  const factory FreezedCounterEvent.decrement() = Decrement;
}
