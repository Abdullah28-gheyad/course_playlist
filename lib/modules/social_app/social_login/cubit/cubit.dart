

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/modules/social_app/social_login/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLoginCubit extends Cubit <SocialLoginStates>
{
  SocialLoginCubit():super(SocialLoginInitialState()) ;
  static SocialLoginCubit get(context)=>BlocProvider.of(context) ;

  void userLogin(
  {
  @required String email ,
  @required String password , 
}
      )
  {
    emit(SocialLoginLoadingState()) ;
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
    .then((value){
      emit(SocialLoginSuccessState()) ;
    })
    .catchError((error){
      print (error.toString()) ;
      emit(SocialLoginErrorState()) ;

    });
  }
}