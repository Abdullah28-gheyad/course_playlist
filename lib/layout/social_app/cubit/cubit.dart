import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstproject/layout/social_app/cubit/states.dart';
import 'package:firstproject/models/social_app/social_user_model.dart';
import 'package:firstproject/modules/social_app/social_chat_screen.dart';
import 'package:firstproject/modules/social_app/social_home_screen.dart';
import 'package:firstproject/modules/social_app/social_post.dart';
import 'package:firstproject/modules/social_app/social_settings_screen.dart';
import 'package:firstproject/shared/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialCubit extends Cubit <SocialStates>
{
  SocialCubit():super(SocialInitialState()) ;
  static SocialCubit get(context)=>BlocProvider.of(context) ;
  int currentIndex = 0 ;
  void changeBottomNav(int index)
  {
    if (index==2)
      {
          emit(SocialPostOpenScreenState()) ;
      }
    else
      {
        currentIndex = index ;
        emit(SocialChangeBottomNavState()) ;
      }

  }

  List <Widget> screens = [
    SocialHomeScreen() ,
    SocialChatScreen() ,
    SocialPostScreen() ,
    SocialSettingsScreen()
  ];
  List<String>titles=['Home','Chat','Post' , 'Settings'];

  SocialUserModel userModel ;
  void getUserData()
  {
    emit(SocialGetUserDataLoadingState()) ;
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value){
          userModel = SocialUserModel.fromJson(value.data()) ;
          emit(SocialGetUserDataSuccessState()) ;

    })
        .catchError((error){
          print (error.toString()) ;
          emit(SocialGetUserDataErrorState()) ;

    }) ;
  }
}