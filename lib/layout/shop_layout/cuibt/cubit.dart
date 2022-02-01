import 'package:firstproject/layout/shop_layout/cuibt/states.dart';
import 'package:firstproject/models/shop_app/category_model.dart';
import 'package:firstproject/models/shop_app/change_favorite_model.dart';
import 'package:firstproject/models/shop_app/favorite_model.dart';
import 'package:firstproject/models/shop_app/home_model.dart';
import 'package:firstproject/models/shop_app/shop_login_class.dart';
import 'package:firstproject/modules/shop_app/category_screen.dart';
import 'package:firstproject/modules/shop_app/favorite_screen.dart';
import 'package:firstproject/modules/shop_app/home_screen.dart';
import 'package:firstproject/modules/shop_app/settings_screen.dart';
import 'package:firstproject/shared/components/constants.dart';
import 'package:firstproject/shared/network/remote/dio_helper.dart';
import 'package:firstproject/shared/network/remote/endPoints.dart';
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
  List <String> titles =
  [
    'Home' ,
    'Categories' ,
    'Favorites' ,
    'Settings'
  ] ;

  Map<int , bool> favorites = {} ;
  HomeModel homeModel ;
  void getHomeData()
  {
    DioHelper.getData(path: HOME ,authorization: token)
    .then((value) {

      homeModel = HomeModel.fromJson(value.data) ;
      print (homeModel.data.products[0].image) ;
      homeModel.data.products.forEach((element) {
        favorites.addAll({element.id:element.inFavorite}) ;
      }) ;
      emit(ShopAppGetHomeDataSuccessState()) ;
    })
    .catchError((error){
      print (error.toString()) ;
      emit(ShopAppGetHomeDataErrorState()) ;
    });
  }

  CategoryModel categoryModel;
  void getCategoryData()
  {
    DioHelper.getData(path: CATEGORY )
        .then((value) {
      categoryModel = CategoryModel.fromJson(value.data) ;
      print (value.data) ;
      emit(ShopAppGetCategoriesDataSuccessState()) ;
    })
        .catchError((error){
      print (error.toString()) ;
      emit(ShopAppGetCategoriesDataErrorState()) ;
    });
  }

  ChangeFavoriteModel changeFavoriteModel ;
  void changeFavorite(int productId)
  {
    favorites[productId] = !favorites[productId] ;
    emit(ShopAppChangeFavoriteSuccessState());
    DioHelper.postData(path: FAVORITE, data: {
      'product_id':productId
    } ,authorization: token)
    .then((value){
      changeFavoriteModel = ChangeFavoriteModel.fromJson(value.data) ;
      print (changeFavoriteModel.message) ;
      emit(ShopAppChangeFavoriteSuccessState()) ;
      getFavoriteData() ;
    })
    .catchError((error){
      print (error) ;
      emit(ShopAppChangeFavoriteErrorState()) ;
    });
  }

  FavoriteModel favoriteModel;
  void getFavoriteData()
  {
    emit(ShopAppGetFavoriteDataLoadingState()) ;
    DioHelper.getData(path: FAVORITE , authorization: token )
        .then((value) {
      favoriteModel = FavoriteModel.fromJson(value.data) ;
      print (value.data) ;
      emit(ShopAppGetFavoriteDataSuccessState()) ;
    })
        .catchError((error){
      print (error.toString()) ;
      emit(ShopAppGetFavoriteDataErrorState()) ;
    });
  }

  ShopLoginModel userModel;
  void getProfileData()
  {
    DioHelper.getData(path: PROFILE , authorization: token )
        .then((value) {
      userModel = ShopLoginModel.fromJson(value.data) ;
      print (value.data) ;
      emit(ShopAppGetProfileDataSuccessState()) ;
    })
        .catchError((error){
      print (error.toString()) ;
      emit(ShopAppGetProfileDataErrorState()) ;
    });
  }

  void updateProfileData(
  {
  @required String name ,
  @required String phone ,
  @required String email ,
}
      )
  {
    emit(ShopAppUpdateProfileDataLoadingState()) ;
      DioHelper.putData(path: UPDATE, data: {
        'name':name ,
        'phone':phone ,
        'email':email ,
      } , authorization: token)
      .then((value) {
        userModel = ShopLoginModel.fromJson(value.data) ;
        emit(ShopAppUpdateProfileDataSuccessState()) ;
      })
      .catchError((error){
        print (error.toString()) ;
        emit(ShopAppUpdateProfileDataErrorState()) ;

      });
  }

}