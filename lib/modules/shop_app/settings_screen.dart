import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstproject/layout/shop_layout/cuibt/cubit.dart';
import 'package:firstproject/layout/shop_layout/cuibt/states.dart';
import 'package:firstproject/modules/flutter_ui/login/login_screen.dart';
import 'package:firstproject/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopSettingsScreen extends StatelessWidget {

  var nameController = TextEditingController() ;
  var emailController = TextEditingController() ;
  var phoneController = TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit , ShopAppStates  >(
      listener: (context , state){},
      builder: (context , state){
        var cubit = ShopAppCubit.get(context) ;
        nameController.text = cubit.userModel.data.name ;
        emailController.text = cubit.userModel.data.email ;
        phoneController.text = cubit.userModel.data.phone ;
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: ConditionalBuilder(
            condition:cubit.userModel!=null,
            fallback: (context)=>Center(child: CircularProgressIndicator()),
            builder: (context)=>Column(
              children: [
                customTextFormField(
                    controller: nameController,
                    type: TextInputType.text,
                    validate: (String value)
                    {
                      if (value.isEmpty)
                        return 'name cannot be empty' ;
                      return null ;
                    },
                    label: 'Name',
                    prfixIcon: Icons.person) ,
                SizedBox(height: 10,) ,
                customTextFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (String value)
                    {
                      if (value.isEmpty)
                        return 'email cannot be empty' ;
                      return null ;
                    },
                    label: 'Email',
                    prfixIcon: Icons.email) ,
                SizedBox(height: 10,) ,
                customTextFormField(
                    controller: phoneController,
                    type: TextInputType.number,
                    validate: (String value)
                    {
                      if (value.isEmpty)
                        return 'phone cannot be empty' ;
                      return null ;
                    },
                    label: 'Phone',
                    prfixIcon: Icons.phone) ,
                SizedBox(height: 10,) ,
                customButton(function: (){
                  navigateToAndRemove(context, ShopLoginScreen()) ;
                }, text: 'LOGOUT')
              ],
            ),
          ),
        ) ;
      },
    ) ;
  }
}
