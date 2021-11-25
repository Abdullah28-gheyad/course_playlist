import 'package:firstproject/layout/todo_app/cubit/cubit.dart';
import 'package:firstproject/layout/todo_app/cubit/states.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:firstproject/shared/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchivedTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit,TodoAppStates>(
      listener: (context , state){},
      builder: (context , state){
        TodoCubit cubit = BlocProvider.of(context) ;
        return ListView.separated(
            itemBuilder: (context,index)=>buildTaskItem(cubit.archiveTasks[index],context),
            separatorBuilder: (context,index)=>Divider(height: 1,color: Colors.grey,)
            , itemCount: cubit.archiveTasks.length
        ) ;
      },
    ) ;
  }
}
//  1. build design
//  2. build list
//  3. put design in list
