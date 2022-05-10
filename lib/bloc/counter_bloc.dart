import 'dart:async';

import 'package:bloc/bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  int count;

  CounterBloc({this.count = 0}) : super(CounterInitial(count)){
  on<IncrementEvent>((event, emit) {
      count++;
      emit(CounterUpdatedState(count));
  });
  
  on<MultiplyEvent>((event, emit) {
      // ignore: unnecessary_statements
      count= count*2;
      emit(CounterUpdatedState(count));
  });
 
  }
}







    
