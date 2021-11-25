import 'package:firstproject/modules/flutter_ui/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());
  int counter = 1 ;
  void plusMethod()
  {
    counter++ ;
    emit(CounterPlusState()) ; //set state
  }

  void minusMethod()
  {
    counter-- ;
    emit(CounterMinusState()) ; //set state
  }
}
