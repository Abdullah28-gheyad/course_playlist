import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget //is widget
{

  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          elevation:  0,
          leading: const Icon(Icons.menu),
          title: const Text('Home Page',style: TextStyle(fontWeight: FontWeight.bold),),
          actions: [
            IconButton(onPressed: (){
            }, icon: const Icon(Icons.error ,color: Colors.yellow,)) ,
          ],
        ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20) ,
              ),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width:200 ,
                    color: Colors.red,
                      child: Text('My Image' , style: TextStyle(fontSize: 20 , color: Colors.white,fontWeight: FontWeight.bold ),textAlign:TextAlign.center,))
                ],
              ),
            ),
          ) ,
        ],
      ),
    );
  }
}
