import 'package:firstproject/layout/news_app/cubit/cubit.dart';
import 'package:firstproject/layout/news_app/cubit/states.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsAppStates>(
        listener: (context,state){},
        builder: (context,state){
          var list = NewsCubit.get(context).searchList ;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: customTextFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      onChanged: (String value)
                      {
                        NewsCubit.get(context).getSearchData(value: value) ;
                      },
                      validate: (String value)
                      {
                        if (value.isEmpty)
                          return 'search cannot be empty ' ;
                        return null ;
                      },
                      label: 'Search',
                      prfixIcon: Icons.search
                  ),
                ),
                Expanded(child: buildArticleList(list)) ,
              ],
            ),
          ) ;
        },
    );
  }
}
