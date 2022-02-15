import 'package:firstproject/layout/social_app/cubit/cubit.dart';
import 'package:firstproject/layout/social_app/cubit/states.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialEditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>() ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        nameController.text = cubit.userModel.name ;
        bioController.text = cubit.userModel.bio ;
        phoneController.text = cubit.userModel.phone ;
        return Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(onPressed: () {
                if (formKey.currentState.validate())
                  {
                    cubit.updateUserData(name: nameController.text, phone: phoneController.text, bio: bioController.text) ;
                  }
              }, child: Text('UPDATE')),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    if (state is SocialUpdateUserLoadingState)
                      LinearProgressIndicator() ,
                    if (state is SocialUpdateUserLoadingState)
                      SizedBox(height: 10,) ,
                    Container(
                      height: 250,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                Image(
                                  image: cubit.coverImage==null?NetworkImage(cubit.userModel.cover):FileImage(cubit.coverImage),
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                      child: IconButton(
                                          onPressed: () {
                                            cubit.getCoverImage() ;
                                          },
                                          icon: Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                          ))),
                                )
                              ],
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 82,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 80,
                                backgroundImage: cubit.profileImage==null?NetworkImage(cubit.userModel.image):FileImage(cubit.profileImage),
                              ),
                              CircleAvatar(
                                  child: IconButton(
                                      onPressed: () {
                                        cubit.getProfileImage() ;
                                      },
                                      icon: Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ))),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customTextFormField(
                        controller: nameController,
                        type: TextInputType.name,
                        validate: (String value){
                          if (value.isEmpty)
                            return 'name cannot be empty' ;
                          return null ;
                        },
                        label: 'Name',
                        prfixIcon: Icons.person) ,
                    SizedBox(height: 10,) ,
                    customTextFormField(
                        controller: bioController,
                        type: TextInputType.text,
                        validate: (String value){
                          if (value.isEmpty)
                            return 'bio cannot be empty' ;
                          return null ;
                        },
                        label: 'Bio',
                        prfixIcon: Icons.info) ,
                    SizedBox(height: 10,) ,
                    customTextFormField(
                        controller: phoneController,
                        type: TextInputType.phone,
                        validate: (String value){
                          if (value.isEmpty)
                            return 'phone cannot be empty' ;
                          return null ;
                        },
                        label: 'Phone',
                        prfixIcon: Icons.phone) ,

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
