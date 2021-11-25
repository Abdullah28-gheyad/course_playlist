import 'dart:math';

import 'package:firstproject/modules/bmi/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiHomeScreen extends StatefulWidget {
  @override
  _BmiHomeScreenState createState() => _BmiHomeScreenState();
}

class _BmiHomeScreenState extends State<BmiHomeScreen> {
  bool isMale = true;

  double height = 133;

  int weight = 60;

  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        elevation: 0,
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isMale ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('assets/images/male.png'),
                            width: 60,
                            height: 60,),
                          const Text('MALE', style: TextStyle(
                              fontSize: 25, color: Colors.white),),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isMale ? Colors.grey : Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(image: AssetImage('assets/images/female.png'),
                            width: 60,
                            height: 60,),
                          const Text('FEMALE', style: TextStyle(
                              fontSize: 25, color: Colors.white),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT',
                    style: TextStyle(fontSize: 25, color: Colors.white),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${height.round().toString()}',
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight
                            .bold, color: Colors.white),),
                      const Text(
                        'CM', style: TextStyle(fontSize: 20, color: Colors
                          .white),),
                    ],
                  ),
                  Slider(
                    value: height,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                    min: 80,
                    max: 220,
                  )
                ],
              ),
            ),
          )),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: TextStyle(
                            fontSize: 25, color: Colors.white),),
                        Text('$weight', style: TextStyle(fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'weight+',
                              onPressed: () {
                              setState(() {
                                weight++;
                              });
                            }, child: Icon(Icons.add),
                              mini: true,),
                            SizedBox(width: 10,),
                            FloatingActionButton
                              (
                              heroTag: 'weight-',
                              onPressed: () {
                              setState(() {
                                weight--;
                              });
                            }, child: Icon(Icons.remove),
                              mini: true,),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE', style: TextStyle(
                            fontSize: 25, color: Colors.white),),
                        Text('$age', style: TextStyle(fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'age+',
                              onPressed: () {
                              setState(() {
                                age++;
                              });
                            }, child: Icon(Icons.add),
                              mini: true,),
                            SizedBox(width: 10,),
                            FloatingActionButton(
                              heroTag: 'weight-',
                              onPressed: () {
                              setState(() {
                                age--;
                              });
                            }, child: Icon(Icons.remove),
                              mini: true,),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
          Container(
              color: Colors.red,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                // BMI = w ÷ (h/100)^2
                  double result = weight/pow(height/100, 2) ;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BmiResultScreen(age: age,isMale: isMale,result: result.round(),)))  ;
                },
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,),
                ),
              ))
        ],
      ),
    );
  }
}


