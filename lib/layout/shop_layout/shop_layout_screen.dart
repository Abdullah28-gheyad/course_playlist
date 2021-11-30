import 'package:firstproject/layout/shop_layout/cuibt/cubit.dart';
import 'package:firstproject/layout/shop_layout/cuibt/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLayoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit , ShopAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = ShopAppCubit.get(context) ;
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: (index){
              cubit.changeBottomNav(index) ;
            },
            currentIndex:cubit.currentIndex ,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home) , label: 'Home') ,
              BottomNavigationBarItem(icon: Icon(Icons.apps) , label: 'Categories') ,
              BottomNavigationBarItem(icon: Icon(Icons.favorite) , label: 'Favorites') ,
              BottomNavigationBarItem(icon: Icon(Icons.settings) , label: 'Settings') ,
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
        ) ;
      },
    );
  }
}
