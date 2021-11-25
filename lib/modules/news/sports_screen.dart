import 'package:firstproject/layout/news_app/cubit/cubit.dart';
import 'package:firstproject/layout/news_app/cubit/states.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCubit.get(context).sports ;
        return list.isNotEmpty?buildArticleList(list):const Center(child: CircularProgressIndicator()) ;
      },
    );
  }
}
