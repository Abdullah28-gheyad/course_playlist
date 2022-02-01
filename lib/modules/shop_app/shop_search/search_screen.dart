import 'package:firstproject/layout/shop_layout/cuibt/cubit.dart';
import 'package:firstproject/models/shop_app/search_model.dart';
import 'package:firstproject/modules/shop_app/shop_search/cubit/cubit.dart';
import 'package:firstproject/modules/shop_app/shop_search/cubit/states.dart';
import 'package:firstproject/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopSearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
              body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  customTextFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      validate: (String value)
                      {
                        if (value.isEmpty)
                          return 'search cannot be empty' ;
                        return null ;
                      },
                      label: 'Search',
                      prfixIcon: Icons.search ,
                      onChanged: (String text)
                      {
                        cubit.userSearch(text: text) ;
                      }
                  ),
                  SizedBox(height: 10,) ,
                  if (state is SearchLoadingState)
                     LinearProgressIndicator() ,
                  if (state is SearchSuccessState)
                    Expanded(
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,index)=>buildProductItem(cubit.searchModel.data.data[index] , context),
                        separatorBuilder: (context,index)=>Divider(color: Colors.grey,),
                        itemCount: cubit.searchModel.data.data.length
                    ),
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
  Widget buildProductItem(SearchProductModel productModel,context)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 120,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(
                    productModel.image),
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      productModel.price.toString(),
                      style: TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                    SizedBox(
                      width: 5,
                    ),

                    Spacer(),
                    CircleAvatar(
                        backgroundColor: productModel.inFavorites? Colors.blue :Colors.grey,
                        child: IconButton(
                          onPressed: () {
                            ShopAppCubit.get(context).changeFavorite(productModel.id) ;
                          },
                          icon: Icon(Icons.favorite_border),
                          iconSize: 16,
                          color: Colors.white,
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

