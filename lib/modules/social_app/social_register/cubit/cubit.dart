import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/modules/social_app/social_register/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialRegisterCubit extends Cubit <SocialRegisterStates>
{
  SocialRegisterCubit():super(SocialRegisterInitialState()) ;
  static SocialRegisterCubit get(context)=>BlocProvider.of(context) ;

  void userRegister(
  {
  @required String email , 
  @required String name , 
  @required String phone , 
  @required String password , 
}
      )
  {
    emit(SocialRegisterLoadingState()) ;
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
    .then((value){
      emit(SocialRegisterSuccessState()) ;
    })
    .catchError((error){
      print (error.toString()) ;
      emit(SocialRegisterErrorState()) ;

    });
  }
}