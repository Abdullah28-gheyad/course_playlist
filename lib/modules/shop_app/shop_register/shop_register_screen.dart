import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstproject/layout/shop_layout/cuibt/cubit.dart';
import 'package:firstproject/layout/shop_layout/shop_layout_screen.dart';
import 'package:firstproject/modules/shop_app/shop_register/cubit/cubit.dart';
import 'package:firstproject/modules/shop_app/shop_register/cubit/states.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopRegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit,ShopRegisterStates>(
        listener: (context,state){
          if (state is ShopRegisterSuccessState)
            {
              ShopAppCubit.get(context).getHomeData() ;
              ShopAppCubit.get(context).getFavoriteData() ;
              ShopAppCubit.get(context).getProfileData() ;
              navigateToAndRemove(context, ShopLayoutScreen()) ;
            }
        },
        builder: (context,state){
          var cubit = ShopRegisterCubit.get(context) ;
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'register to see our hot offers',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        customTextFormField(
                            controller: nameController,
                            type: TextInputType.text,
                            validate: (String value) {
                              if (value.isEmpty) return 'name cannot be empty';
                              return null;
                            },
                            label: 'Name',
                            prfixIcon: Icons.perm_identity),
                        SizedBox(
                          height: 10,
                        ),
                        customTextFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String value) {
                              if (value.isEmpty) return 'email cannot be empty';
                              return null;
                            },
                            label: 'Email',
                            prfixIcon: Icons.email),
                        SizedBox(
                          height: 10,
                        ),
                        customTextFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            validate: (String value) {
                              if (value.isEmpty) return 'password cannot be empty';
                              return null;
                            },
                            label: 'Password',
                            isSecure: true,
                            prfixIcon: Icons.lock,
                            suffixIcon: Icons.visibility_off),
                        SizedBox(
                          height: 10,
                        ),
                        customTextFormField(
                            controller: phoneController,
                            type: TextInputType.number,
                            validate: (String value) {
                              if (value.isEmpty) return 'phone cannot be empty';
                              return null;
                            },
                            label: 'Phone',
                            prfixIcon: Icons.phone),
                        SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          fallback:(context)=>Center(child: CircularProgressIndicator()) ,
                          builder:(context)=>customButton(
                              function: () {
                                if (formKey.currentState.validate()) {
                                  cubit.userRegister(name: nameController.text, email: emailController.text, password: passwordController.text, phone: phoneController.text) ;
                                }
                              },
                              text: 'Register'),
                          condition: state is !ShopRegisterLoadingState ,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ) ;
        },
      ),
    );
  }
}
