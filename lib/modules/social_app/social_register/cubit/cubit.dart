import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/models/social_app/social_user_model.dart';
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
      createUser(phone: phone,name: name,email: email ,password: password , uId: value.user.uid) ;
    })
    .catchError((error){
      print (error.toString()) ;
      emit(SocialRegisterErrorState()) ;

    });
  }

  SocialUserModel model ;
  void createUser(
  {
    @required String email ,
    @required String name ,
    @required String phone ,
    @required String password ,
    @required String uId ,
  }
      )
  {
    model = SocialUserModel(password: password , uId: uId ,email: email , name: name , phone: phone) ;
      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(model.toMap()).then((value) {
        emit(SocialCreateSuccessState()) ;
      })
          .catchError((error){
            print (error.toString()) ;
            emit(SocialCreateErrorState());
      }) ;
  }

}