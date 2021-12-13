import 'dart:developer';

import 'package:firstproject/layout/news_app/cubit/cubit.dart';
import 'package:firstproject/layout/news_app/cubit/states.dart';
import 'package:firstproject/layout/news_app/news_home_layout.dart';
import 'package:firstproject/layout/shop_layout/cuibt/cubit.dart';
import 'package:firstproject/layout/todo_app/home_screen.dart';
import 'package:firstproject/modules/bmi/bmi_home_screen.dart';
import 'package:firstproject/modules/bmi/bmi_result_screen.dart';
import 'package:firstproject/modules/flutter_ui/counter/counter_screen.dart';
import 'package:firstproject/modules/flutter_ui/chat/chat_screen.dart';
import 'package:firstproject/modules/flutter_ui/home/home_screen.dart';
import 'package:firstproject/modules/flutter_ui/login/login_screen.dart';
import 'package:firstproject/shared/bloc_observer.dart';
import 'package:firstproject/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/shop_app/shop_login/shop_login_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp()); //run the app
}

//stateless wid
//stateful wid
class MyApp extends StatelessWidget //abst class  //inhrt wid
{
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (BuildContext context) => NewsCubit()
      // ..getBusinessData()
      // ..getSportsData()
      // ..getScienceData(),),
        ),
        BlocProvider(create: (BuildContext context) =>ShopAppCubit()),
      ],
        child: BlocConsumer<NewsCubit, NewsAppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  )),
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                      iconTheme: IconThemeData(color: Colors.black),
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Colors.white,
                          statusBarBrightness: Brightness.dark),
                      titleTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      backgroundColor: Colors.white,
                      elevation: 0),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData()),
              darkTheme: ThemeData(
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  )),
                  scaffoldBackgroundColor: Colors.grey[800],
                  appBarTheme: AppBarTheme(
                      iconTheme: IconThemeData(color: Colors.white),
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Colors.grey[800],
                          statusBarIconBrightness: Brightness.light),
                      titleTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      backgroundColor: Colors.grey[800],
                      elevation: 0),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      backgroundColor: Colors.grey[800],
                      unselectedItemColor: Colors.grey)),
              themeMode: NewsCubit.get(context).isLight
                  ? ThemeMode.light
                  : ThemeMode.dark,
              debugShowCheckedModeBanner: false,
              home: ShopLoginScreen(),
            );
          },
        ),
      );
  }
}

//https://newsapi.org/v2/top-headlines?country=eg&apiKey=74592581d0744ffc82c62241d987b1f6
