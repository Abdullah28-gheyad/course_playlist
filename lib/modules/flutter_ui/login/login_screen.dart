import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController() ;

  var passwordController = TextEditingController() ;

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key:formKey , //special for form
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  customTextFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (String value){
                        if (value.isEmpty)
                          return 'email cannot be empty' ;
                        return null ;
                      },
                      label: 'Email',
                      prfixIcon: Icons.email
                  ) ,
                  SizedBox(
                    height: 15,
                  ),
                  customTextFormField(
                    isSecure: isPassword,
                      suffixPress: (){
                          setState(() {
                            isPassword = !isPassword ;
                          });
                      },
                      suffixIcon: isPassword?Icons.visibility:Icons.visibility_off,
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (String value){
                        if (value.isEmpty)
                          return 'Password cannot be empty' ;
                        return null ;
                      },
                      label: 'Password',
                      prfixIcon: Icons.lock
                  ) ,
                  SizedBox(
                    height: 15,
                  ),
                  customButton(color: Colors.red, function: (){
                    if(formKey.currentState.validate())
                      {

                      }
                  }, text: 'LOGIN') ,
                  SizedBox(height: 20,) ,
                  customButton(text: 'Register',function: (){print('register') ; }) ,
                  SizedBox(height: 20,) ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have account ?') ,
                      TextButton(onPressed: (){}, child: Text('Register here' ))
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
