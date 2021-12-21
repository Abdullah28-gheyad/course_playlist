import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstproject/layout/shop_layout/cuibt/cubit.dart';
import 'package:firstproject/layout/shop_layout/cuibt/states.dart';
import 'package:firstproject/models/shop_app/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopFavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit , ShopAppStates>(
     listener: (context,state){},
     builder: (context,state){
       var cubit = ShopAppCubit.get(context) ;
       return ConditionalBuilder(
         builder: (context)=>ListView.separated(
             physics: BouncingScrollPhysics(),
             itemBuilder: (context,index)=>buildFavoriteItem(cubit.favoriteModel.data.data[index].productModel , context),
             separatorBuilder: (context,index)=>Divider(color: Colors.grey,),
             itemCount: cubit.favoriteModel.data.data.length
         ),
         fallback: (context)=>Center(child: CircularProgressIndicator()),
         condition: state is ! ShopAppGetFavoriteDataLoadingState,

       ) ;
     },
    );
  }
  Widget buildFavoriteItem(ProductModel productModel,context)=>Padding(
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
              if (productModel.discount!= 0)
                   Container(
                  color: Colors.grey[800],
                  width: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'DISOCUNT',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ))
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
                      if (productModel.discount!=0)
                      Text(
                        productModel.oldPrice.toString(),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough),
                      ),
                    Spacer(),
                    CircleAvatar(
                        backgroundColor: ShopAppCubit.get(context).favorites[productModel.id]? Colors.blue :Colors.grey,
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
