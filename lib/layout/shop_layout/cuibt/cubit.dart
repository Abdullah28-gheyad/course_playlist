import 'package:firstproject/layout/shop_layout/cuibt/states.dart';
import 'package:firstproject/modules/shop_app/category_screen.dart';
import 'package:firstproject/modules/shop_app/favorite_screen.dart';
import 'package:firstproject/modules/shop_app/home_screen.dart';
import 'package:firstproject/modules/shop_app/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopAppCubit extends Cubit <ShopAppStates>
{
  ShopAppCubit():super(ShopAppInitialState()) ;
  static ShopAppCubit get(context)=>BlocProvider.of(context) ;
  int currentIndex = 0 ;
  void changeBottomNav(int index)
  {
    currentIndex = index ;
    emit(ShopAppChangeBottomNavState()) ;
  }

  List <Widget> screens =
      [
        ShopHomeScreen() ,
        ShopCategoryScreen() ,
        ShopFavoriteScreen() ,
        ShopSettingsScreen()
      ] ;
}