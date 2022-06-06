import 'package:bloc/bloc.dart';
import 'package:newchat/bloc/counter_event.dart';
import 'package:newchat/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterAddEvent>(_adicionar);
    on<CounterSubtractEvent>(_subtract);
    on<CounterResetEvent>(_reset);
    on<CounterMultiplyEvent>(_multiply);
  }

  void _adicionar(CounterAddEvent event, Emitter<CounterState> emitter) {
    var counterAgora = state.counterValue;
    counterAgora += 1;
    emitter(state.copyWith(counterValue: counterAgora, status: CounterStatus.add));
  }

  void _subtract(CounterSubtractEvent event, Emitter<CounterState> emitter) {
    var counterAgora = state.counterValue;
    counterAgora -= 1;
    emitter(state.copyWith(counterValue: counterAgora, status: CounterStatus.subtract));
  }

  void _reset(CounterResetEvent event, Emitter<CounterState> emitter) {
    emitter(state.copyWith(counterValue: 0, status: CounterStatus.reset));
  }

  void _multiply(CounterMultiplyEvent event, Emitter<CounterState> emitter) {
    var counterAgora = state.counterValue;
    counterAgora *= event.valor;
    emitter(state.copyWith(
        counterValue: counterAgora, status: CounterStatus.multiply));
  }
}
