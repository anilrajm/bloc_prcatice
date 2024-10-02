import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_counter_event.dart';
part 'freezed_counter_state.dart';
part 'freezed_counter_bloc.freezed.dart';

class FreezedCounterBloc extends Bloc<FreezedCounterEvent, FreezedCounterState> {
  FreezedCounterBloc() : super(const FreezedCounterState.initial()) {
    on<FreezedCounterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
