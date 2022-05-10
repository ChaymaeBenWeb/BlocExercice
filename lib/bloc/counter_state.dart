part of 'counter_bloc.dart';

abstract class CounterState{
  final int count;
  CounterState(this.count);
  @override
  List<Object> get props => [count];
}

class CounterInitial extends CounterState {
  CounterInitial(int count) : super(count);
}

class CounterUpdatedState extends CounterState {
  CounterUpdatedState(int count) : super(count);
}
