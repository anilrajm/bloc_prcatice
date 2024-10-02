import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<Increment>((event, emit) {
      final userInput = event.userInput;
      emit(CounterUpdated(
        count: state.count + 1 + userInput,
        isSnackBarVisible: false,
      ));
    });
    on<Decrement>((event, emit) {
      emit(CounterUpdated(count: state.count - 1, isSnackBarVisible: false));
    });

    on<Reset>((event, emit) {
      emit(const CounterInitial());
    });

    on<ShowSnackBar>((event, emit) {
      emit(CounterUpdated(count: state.count, isSnackBarVisible: true));
    });
  }
}
