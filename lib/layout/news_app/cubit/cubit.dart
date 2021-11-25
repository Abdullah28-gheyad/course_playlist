import 'package:firstproject/layout/news_app/cubit/states.dart';
import 'package:firstproject/modules/news/business_screen.dart';
import 'package:firstproject/modules/news/science_screen.dart';
import 'package:firstproject/modules/news/sports_screen.dart';
import 'package:firstproject/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit <NewsAppStates>
{
  NewsCubit():super(NewsInitialState()) ;
  int currentIndex = 0 ;
   static NewsCubit get(context)=>BlocProvider.of(context) ;
   void changeBottomNav(int index)
   {
     currentIndex = index ;
     emit(NewsChangeBottomNavState()) ;
   }
   List <Widget> screens = [
     BusinessScreen() ,
     SportsScreen() ,
     ScienceScreen() ,
   ] ;

   List business = [] ;
   void getBusinessData()
   {
     DioHelper.getData(path: 'v2/top-headlines', query: {
       'country':'eg' ,
       'category':'business' ,
       'apiKey':'74592581d0744ffc82c62241d987b1f6'
     })
         .then((value){
       print (value.data['articles'][0]['title'].toString()) ;
       business = value.data['articles'] ;
       print (business[0]['url']) ;
       emit(GetBusinessDataSuccessState()) ;
     })
     .catchError((error){
       print (error.toString()) ;
       emit(GetBusinessDataErrorState()) ;
     });
   }

   List sports =[] ;
   void getSportsData()
   {
     DioHelper.getData(path: 'v2/top-headlines', query: {
       'country':'eg' ,
       'category':'sports' ,
       'apiKey':'74592581d0744ffc82c62241d987b1f6'
     })
     .then((value) {
       print (value.data['articles'][0]['title'].toString()) ;
       sports = value.data['articles'] ;
       emit(GetSportsDataSuccessState()) ;
     })
     .catchError( (error){
       print (error.toString()) ;
       emit(GetSportsDataErrorState()) ;
     });
   }


  List science =[] ;
  void getScienceData()
  {
    DioHelper.getData(path: 'v2/top-headlines', query: {
      'country':'eg' ,
      'category':'science' ,
      'apiKey':'74592581d0744ffc82c62241d987b1f6'
    })
        .then((value) {
      print (value.data['articles'][0]['title'].toString()) ;
      science = value.data['articles'] ;
      emit(GetScienceDataSuccessState()) ;
    })
        .catchError( (error){
      print (error.toString()) ;
      emit(GetScienceDataErrorState()) ;
    });
  }

  List searchList =[] ;
  void getSearchData(
  {
  @required String value
}
      )
  {
    DioHelper.getData(path: 'v2/everything', query: {

      'q':value ,
      'apiKey':'74592581d0744ffc82c62241d987b1f6'
    })
        .then((value) {
      print (value.data['articles'][0]['title'].toString()) ;
      searchList = value.data['articles'] ;
      emit(GetSearchDataSuccessState()) ;
    })
        .catchError( (error){
      print (error.toString()) ;
      emit(GetSearchDataErrorState()) ;
    });
  }

  bool isLight = true ;
  void changeThemeMode()
  {
    isLight = !isLight ;
    emit(ChangeThemeModeState()) ;
  }

  //GET https://newsapi.org/v2/everything?q=bitcoin&apiKey=74592581d0744ffc82c62241d987b1f6
}