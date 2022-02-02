import 'package:firstproject/modules/social_app/social_register/cubit/cubit.dart';
import 'package:firstproject/modules/social_app/social_register/cubit/states.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialRegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var phoneController = TextEditingController();

  var nameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit, SocialRegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SocialRegisterCubit.get(context);
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
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Register to communicate with friends',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        customTextFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String value) {
                              if (value.isEmpty)
                                return 'please enter your email';
                              return null;
                            },
                            label: 'Email',
                            prfixIcon: Icons.email),
                        SizedBox(
                          height: 10,
                        ),
                        customTextFormField(
                          controller: nameController,
                          type: TextInputType.text,
                          validate: (String value) {
                            if (value.isEmpty) return 'please enter your name';
                            return null;
                          },
                          label: 'Name',
                          prfixIcon: Icons.person,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customTextFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            validate: (String value) {
                              if (value.isEmpty)
                                return 'please enter your password';
                              return null;
                            },
                            label: 'Password',
                            prfixIcon: Icons.lock,
                            isSecure: true),
                        SizedBox(
                          height: 10,
                        ),
                        customTextFormField(
                            controller: phoneController,
                            type: TextInputType.number,
                            validate: (String value) {
                              if (value.isEmpty)
                                return 'please enter your phone';
                              return null;
                            },
                            label: 'Phone',
                            prfixIcon: Icons.phone),
                        SizedBox(
                          height: 10,
                        ),
                        customButton(
                          function: () {
                            if (formKey.currentState.validate()) {
                              cubit.userRegister(
                                  email: emailController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text);
                            }
                          },
                          text: 'Register',
                        ),
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
