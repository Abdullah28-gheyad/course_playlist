import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopRegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var phoneController = TextEditingController();

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
                  customButton(
                      function: () {
                        if (formKey.currentState.validate()) {}
                      },
                      text: 'Register')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
