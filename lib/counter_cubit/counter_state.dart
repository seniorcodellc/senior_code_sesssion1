part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}
class CounterIncreaseChanged extends CounterState {}
class CounterDecreaseChanged extends CounterState {}
