import 'package:bloc/bloc.dart';
import 'package:newchat/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void adicionar() {
    var counterAgora = state.counterValue;
    counterAgora += 1;
    emit(state.copyWith(counterValue: counterAgora, status: CounterStatus.add));
  }

  void subtract() {
    var counterAgora = state.counterValue;
    counterAgora -= 1;
    emit(state.copyWith(
        counterValue: counterAgora, status: CounterStatus.subtract));
  }

  void reset() {
    emit(state.copyWith(counterValue: 0, status: CounterStatus.reset));
  }

  void multiply(int valor) {
    var counterAgora = state.counterValue;
    counterAgora *= valor;
    emit(state.copyWith(
        counterValue: counterAgora, status: CounterStatus.multiply));
  }
}
