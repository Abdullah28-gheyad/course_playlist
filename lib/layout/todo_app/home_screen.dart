import 'package:firstproject/layout/todo_app/cubit/cubit.dart';
import 'package:firstproject/layout/todo_app/cubit/states.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:firstproject/shared/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class TodoHomeScreen extends StatelessWidget {


  var scaffoldKey = GlobalKey<ScaffoldState>() ;
  var formKey = GlobalKey<FormState>() ;
  var titleController = TextEditingController() ;
  var timeController = TextEditingController() ;
  var dateController = TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>TodoCubit()..createDataBase(),
      child : BlocConsumer<TodoCubit,TodoAppStates>(
        listener: (context,state){
          if (state is TodoInsertDataBaseState) {
            Navigator.pop(context) ;
          }
        },
        builder: (context,state){
          TodoCubit cubit = BlocProvider.of(context) ;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isShown)
                {
                  if (formKey.currentState.validate())
                  {
                    cubit.insertToDataBase(taskTitle: titleController.text, taskDate: dateController.text, taskTime: timeController.text);
                    cubit.changeBottomSheet(false) ;
                  }
                }
                else
                {
                  scaffoldKey.currentState.showBottomSheet((context) =>
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              customTextFormField(
                                  controller: titleController,
                                  type: TextInputType.text,
                                  validate: (String value )
                                  {
                                    if (value.isEmpty)
                                      return 'title cannot be empty' ;
                                    return null ;
                                  },
                                  label: 'Task Title',
                                  prfixIcon: Icons.title
                              ) ,
                              SizedBox(height: 10,) ,
                              customTextFormField(
                                  onTap: (){
                                    showTimePicker(context: context, initialTime: TimeOfDay.now())
                                        .then((value) {
                                      timeController.text = value.format(context) ;
                                    });
                                  },
                                  controller: timeController,
                                  type: TextInputType.datetime,
                                  validate: (String value )
                                  {
                                    if (value.isEmpty)
                                      return 'time cannot be empty' ;
                                    return null ;
                                  },
                                  label: 'Task Time',
                                  prfixIcon: Icons.watch_later_outlined
                              ) ,
                              SizedBox(height: 10,) ,
                              customTextFormField(
                                  onTap: (){
                                    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.parse("2021-12-24"))
                                        .then((value){
                                      dateController.text =  DateFormat.yMMMMd().format(value) ;
                                    });
                                  },
                                  controller: dateController,
                                  type: TextInputType.datetime,
                                  validate: (String value )
                                  {
                                    if (value.isEmpty)
                                      return 'date cannot be empty' ;
                                    return null ;
                                  },
                                  label: 'Task Date',
                                  prfixIcon: Icons.calendar_today_outlined
                              ) ,
                            ],
                          ),
                        ),
                      ))
                      .closed.then((value) {
                   cubit.changeBottomSheet(false) ;
                  });
                 cubit.changeBottomSheet(true) ;
                }
              },
              child: cubit.isShown? Icon(Icons.add):Icon(Icons.edit),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (int index) {
                cubit.changeIndex(index) ;
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: 'Done Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'Archive Tasks'),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
          ) ;
        },
      ),
    );
  }

  Future<String> getName() async // time
      {
    return 'Abdullah';
  }


}


