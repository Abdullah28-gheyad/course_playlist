import 'package:firstproject/layout/social_app/cubit/cubit.dart';
import 'package:firstproject/layout/social_app/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialSettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = SocialCubit.get(context) ;
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 250,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Image(image: NetworkImage(cubit.userModel.cover) ,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 82,
                    ),
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(cubit.userModel.image),
                    )
                  ],
                ),
              ) ,
              SizedBox(height: 10,) ,
              Text(cubit.userModel.name , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),) ,
              Text(cubit.userModel.bio),
              SizedBox(height: 20,) ,
              Row(
                children: [
                  Expanded(child: OutlinedButton(onPressed: (){}, child: Text('Edit'))) ,
                  SizedBox(width: 5,) ,
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit , color: Colors.blue,size: 15,))
                ],
              )
            ],
          ),
        ) ;
      },
    ) ;
  }
}
