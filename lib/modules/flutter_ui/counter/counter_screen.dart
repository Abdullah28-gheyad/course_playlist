import 'package:firstproject/modules/flutter_ui/counter/cubit/cubit.dart';
import 'package:firstproject/modules/flutter_ui/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
            listener: (context,state){},
            builder: (context,state){
              CounterCubit c = BlocProvider.of(context) ;
              return Scaffold(
                appBar: AppBar(
                  title: Text('Counter Screen'),
                ),
                body: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {
                        c.plusMethod();
                      }, child: Text('Plus'),),
                      Text('${c.counter}' , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),)  ,
                      TextButton(onPressed: () {
                        c.minusMethod();
                      }, child: Text('Minus'),),
                    ]
                    ,
                  ),
                ),
              );
            },
      ),
    );
  }
}
