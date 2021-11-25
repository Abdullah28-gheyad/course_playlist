import 'package:firstproject/layout/todo_app/cubit/states.dart';
import 'package:firstproject/modules/todo/archived_task_screen.dart';
import 'package:firstproject/modules/todo/done_task_screen.dart';
import 'package:firstproject/modules/todo/new_task_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class TodoCubit extends Cubit <TodoAppStates>
{
  TodoCubit():super(TodoInitialState()) ;
  List<Widget> screens = [
    NewTaskScreen(),
    DoneTaskScreen(),
    ArchivedTaskScreen()
  ];

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  int currentIndex = 0;

  void changeIndex(int index)
  {
    currentIndex = index ;
    emit(TodoChangeBottomNavBarState()) ;
  }


  Database database ;
  List <Map> tasks =[] ;
  List <Map> newTasks =[] ;
  List <Map> doneTasks =[] ;
  List <Map> archiveTasks =[] ;

  void createDataBase()  {
    openDatabase('TODO.db', version: 1, onCreate: (database, version) {
      print('data base is created');
      database
          .execute(
          'create table task (id integer primary key , title text ,date text , time text , status text )')
          .then((value) {
        print('table is created ');
      }).catchError((error) {
        print(error.toString());
      });
    }, onOpen: (database) {
      print('data base is opened');
      getDataFromDataBase(database);

    }).then((value) {
      database = value ;
      emit(TodoCreateDataBaseState());
    });
  }
  void getDataFromDataBase(database)
   {
     tasks =[] ;
     newTasks =[] ;
     doneTasks =[] ;
     archiveTasks =[] ;
      database.rawQuery('select * from task').then((value){
        tasks = value ;
        for (var element in tasks) {
          if (element['status']=='new') {
            newTasks.add(element) ;
          } else if (element['status']=='done') {
            doneTasks.add(element) ;
          } else {
            archiveTasks.add(element) ;
          }
        }
        emit(TodoGetDataBaseState()) ;

      });
  }

  void insertToDataBase (
      {
        @required taskTitle ,
        @required taskDate ,
        @required taskTime ,
      }
      ) async
  {
    await database.transaction((txn){
      txn.rawInsert('insert into task (title , date , time , status) values ("$taskTitle" , "$taskDate" , "$taskTime" , "new")')
          .then((value) {
        emit(TodoInsertDataBaseState()) ;
        getDataFromDataBase(database);
        print ("Record added successfully") ;
      })
          .catchError((error)
      {
        print ('here is error ') ;
        print (error.toString()) ;
      }
      );
      return null ;
    });
  }

  void updateDataBase(
  {
@required String status ,
@required int id ,
}
      )
  {
     database.rawUpdate(
        'UPDATE task SET status = ? WHERE id = ?',
        [status, id ])
     .then((value) {
       emit(TodoUpdateDataBaseState()) ;
       getDataFromDataBase(database) ;
     });

  }
  void deleteDataBase(
  {
  @required int id ,
}
      )
  {
       database
        .rawDelete('DELETE FROM task WHERE id = ?', [id])
       .then((value) {
         getDataFromDataBase(database) ;
         emit(TodoDeleteDataBaseState());
       });

  }
  bool isShown = false ;

  void changeBottomSheet(bool x)
  {
    isShown = x ;
    emit(ChangeBottomSheetState()) ;
  }

}