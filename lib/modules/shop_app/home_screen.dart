import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstproject/layout/shop_layout/cuibt/cubit.dart';
import 'package:firstproject/layout/shop_layout/cuibt/states.dart';
import 'package:firstproject/models/shop_app/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = ShopAppCubit.get(context) ;
        return ConditionalBuilder(
          condition: cubit.homeModel!=null,
          fallback: (context)=>Center(child: CircularProgressIndicator()),
          builder: (context)=>SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                CarouselSlider(
                    items: cubit.homeModel.data.banners.map((e) => Image(image: NetworkImage(e.image) , fit: BoxFit.cover , width: double.infinity,height: 250,),).toList(),
                    options: CarouselOptions(
                      scrollPhysics: BouncingScrollPhysics() ,
                      viewportFraction: 1,
                      height: 250 ,
                      autoPlay: true ,
                      initialPage: 0 ,
                      autoPlayInterval: Duration(seconds: 3) ,

                    )),
                SizedBox(height: 10,) ,
                Container(
                  color: Colors.grey[300],
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 1/1.47,
                      crossAxisCount: 2 ,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    children: List.generate(cubit.homeModel.data.products.length, (index) =>buildItem(cubit.homeModel.data.products[index]) ),
                  ),
                )
              ],
            ),
          ),

        ) ;
      },
    ) ;
  }
  Widget buildItem(ProductModel model)=>Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(image: NetworkImage(model.image) , width: double.infinity,height: 200,),
            if(model.discount!=0)
              Container(
              color: Colors.red,
                child: Text('DISCOUNT' , style: TextStyle(fontSize: 12 , color: Colors.white),))
          ],
        ) ,
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.name , maxLines: 2, overflow: TextOverflow.ellipsis,) ,
              Row(
                children: [
                  Text(model.price.toString() , style: TextStyle(color: Colors.blue , fontSize: 14),) ,
                  SizedBox(width: 5,) ,
                  if(model.discount!=0)
                     Text(model.oldPrice.toString() , style: TextStyle(color: Colors.grey , fontSize: 12,decoration: TextDecoration.lineThrough),) ,
                  Spacer() ,
                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))
                ],
              ),
            ],
          ),
        )
      ],
    ),
  ) ;
}