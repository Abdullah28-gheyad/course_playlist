import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstproject/layout/shop_layout/cuibt/cubit.dart';
import 'package:firstproject/layout/shop_layout/shop_layout_screen.dart';
import 'package:firstproject/modules/shop_app/shop_login/cubit/cubit.dart';
import 'package:firstproject/modules/shop_app/shop_login/cubit/states.dart';
import 'package:firstproject/modules/shop_app/shop_register/shop_register_screen.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginScreen extends StatelessWidget {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (context , state){
          if (state is ShopLoginSuccessState)
            {
              if (state.model.status)
                {
                  ShopAppCubit.get(context).getHomeData() ;
                  ShopAppCubit.get(context).getFavoriteData() ;
                  navigateToAndRemove(context, ShopLayoutScreen()) ;
                }
              else
                {
                  print ('please check your email and password') ;
                }
            }

        },
        builder: (context , state){
          var cubit = ShopLoginCubit.get(context) ;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,

            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'login to see our hot offers',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
                            isSecure: cubit.isSecure,
                            suffixPress: (){
                                cubit.changePasswordSecure() ;
                            },
                            prfixIcon: Icons.lock,
                            suffixIcon: cubit.isSecure?Icons.visibility:Icons.visibility_off
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ConditionalBuilder(
                         builder: (context)=>customButton(
                           function: () {
                             if (formKey.currentState.validate()) {
                               cubit.userLogin(email: emailController.text, password: passwordController.text);
                             }
                           },
                           text: 'Login',
                         ),
                          fallback: (context)=>Center(child: CircularProgressIndicator()),
                          condition: state is !ShopLoginLoadingState,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dont have account?'),
                            TextButton(
                                onPressed: () {
                                  navigateTo(context, ShopRegisterScreen());
                                },
                                child: Text('Register Here')),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
