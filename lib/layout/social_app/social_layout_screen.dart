import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstproject/layout/social_app/cubit/cubit.dart';
import 'package:firstproject/layout/social_app/cubit/states.dart';
import 'package:firstproject/modules/social_app/social_post.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLayoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if (state is SocialPostOpenScreenState)
          {
            navigateTo(context, SocialPostScreen());
          }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
          ),
          body: ConditionalBuilder(
            fallback: (context)=>Center(child: CircularProgressIndicator()),
            builder: (context)=>cubit.screens[cubit.currentIndex],
            condition: cubit.userModel!=null,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (int index) {
              cubit.changeBottomNav(index);
            },
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chat'),
              BottomNavigationBarItem(icon: Icon(Icons.upload_file), label: 'Post'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
