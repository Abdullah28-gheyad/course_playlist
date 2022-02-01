import 'package:firstproject/models/shop_app/shop_login_class.dart';
import 'package:firstproject/modules/shop_app/shop_register/cubit/states.dart';
import 'package:firstproject/shared/components/constants.dart';
import 'package:firstproject/shared/network/remote/dio_helper.dart';
import 'package:firstproject/shared/network/remote/endPoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopRegisterCubit extends Cubit <ShopRegisterStates>
{
  ShopRegisterCubit():super(ShopRegisterInitialState()) ;
  static ShopRegisterCubit get(context)=>BlocProvider.of(context) ;
  UserModel userModel ;
  void userRegister(
  {
  @required String name ,
  @required String email ,
  @required String password ,
  @required String phone ,
}
      )
  {
    emit(ShopRegisterLoadingState()) ;
     DioHelper.postData(path: REGISTER, data: {
       'name':name ,
       'email':email ,
       'password':password ,
       'phone':phone ,
     }).then((value) {
      userModel = UserModel.fromJson(value.data) ;
      token = userModel.token ;
       emit(ShopRegisterSuccessState()) ;

     })
     .catchError((error){
       print (error.toString()) ;
       emit(ShopRegisterErrorState()) ;

     });
  }
}