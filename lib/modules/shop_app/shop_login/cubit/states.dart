import 'package:firstproject/models/shop_app/shop_login_class.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialState extends ShopLoginStates {}

class ShopLoginSuccessState extends ShopLoginStates {
  ShopLoginModel model ;
  ShopLoginSuccessState({this.model}) ;
}

class ShopLoginErrorState extends ShopLoginStates {}

class ChangePasswordSecureState extends ShopLoginStates {}
