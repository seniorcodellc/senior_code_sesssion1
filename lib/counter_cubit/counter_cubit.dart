import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int counter = 0;
  CounterCubit() : super(CounterInitial());
  increase() {
    counter++;
    emit(CounterIncreaseChanged());
  }

  decrease() {
    counter--;
    emit(CounterDecreaseChanged());
  }
}
