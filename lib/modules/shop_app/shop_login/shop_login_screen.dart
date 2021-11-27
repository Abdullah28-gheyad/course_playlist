import 'package:firstproject/modules/shop_app/shop_register/shop_register_screen.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopLoginScreen extends StatelessWidget {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                      prfixIcon: Icons.lock,
                      suffixIcon: Icons.visibility_off),
                  SizedBox(
                    height: 10,
                  ),
                  customButton(
                    function: () {
                      if (formKey.currentState.validate()) {}
                    },
                    text: 'Login',
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
  }
}