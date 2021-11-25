import 'package:dio/dio.dart';
import 'package:firstproject/layout/news_app/cubit/cubit.dart';
import 'package:firstproject/layout/news_app/cubit/states.dart';
import 'package:firstproject/modules/news/search_screen.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:firstproject/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsAppStates>(
       listener: (context,state){},
       builder: (context,state){
         NewsCubit cubit = NewsCubit.get(context) ;
         return Scaffold(
           bottomNavigationBar: BottomNavigationBar(
             currentIndex: cubit.currentIndex,
             onTap: (index){
                  cubit.changeBottomNav(index) ;
             },
             items: const [
               BottomNavigationBarItem(icon: Icon(Icons.business) ,label: 'Business') ,
               BottomNavigationBarItem(icon: Icon(Icons.sports) ,label: 'Sports') ,
               BottomNavigationBarItem(icon: Icon(Icons.science) ,label: 'Sciences') ,
             ],
           ),
           body: cubit.screens[cubit.currentIndex],
           appBar: AppBar(
             title: Text('News App'),
             actions: [
               IconButton(onPressed: (){
                 navigateTo(context, SearchScreen());
               }, icon: Icon(Icons.search)),
               IconButton(onPressed: (){
                  NewsCubit.get(context).changeThemeMode() ;
               }, icon: Icon(Icons.brightness_4_outlined)),
             ],
           ),
         ) ;
       },
      );

  }
}
