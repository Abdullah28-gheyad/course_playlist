import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  BmiResultScreen({this.result,this.age,this.isMale}) ;
  int age ;
  bool isMale ;
  int result ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isMale? Text('Gender: Male' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),): Text('Gender: Female' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
            Text('Age: $age' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),) ,
            Text('Result: $result' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),) ,
          ],
        ),
      ),
    );
  }
}
