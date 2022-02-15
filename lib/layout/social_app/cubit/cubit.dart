import 'dart:io';

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
import 'package:image_picker/image_picker.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  void changeBottomNav(int index) {
    if (index == 2) {
      emit(SocialPostOpenScreenState());
    } else {
      currentIndex = index;
      emit(SocialChangeBottomNavState());
    }
  }

  List<Widget> screens = [
    SocialHomeScreen(),
    SocialChatScreen(),
    SocialPostScreen(),
    SocialSettingsScreen()
  ];
  List<String> titles = ['Home', 'Chat', 'Post', 'Settings'];

  SocialUserModel userModel;

  void getUserData() {
    emit(SocialGetUserDataLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = SocialUserModel.fromJson(value.data());
      emit(SocialGetUserDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetUserDataErrorState());
    });
  }

  void updateUserData({
    @required String name,
    @required String phone,
    @required String bio,
  }) {
    emit(SocialUpdateUserLoadingState());
    userModel = SocialUserModel(
        email: userModel.email,
        name: name,
        phone: phone,
        image: userModel.image,
        bio: bio,
        cover: userModel.cover,
        uId: uId,
        password: userModel.password);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(userModel.toMap())
        .then((value) {
      getUserData();
      emit(SocialUpdateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialUpdateUserErrorState());
    });
  }

  File profileImage;
  var picker = ImagePicker();

  void getProfileImage() {
    picker.pickImage(source: ImageSource.gallery).then((value) {
      profileImage = File(value.path);
      emit(SocialPickProfileImageSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialPickProfileImageErrorState()) ;
    });
  }

  File coverImage;


  void getCoverImage() {
    picker.pickImage(source: ImageSource.gallery).then((value) {
      coverImage = File(value.path);
      emit(SocialPickCoverImageSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialPickCoverImageErrorState()) ;
    });
  }
}
