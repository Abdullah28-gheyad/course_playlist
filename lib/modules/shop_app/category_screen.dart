import 'package:firstproject/layout/shop_layout/cuibt/cubit.dart';
import 'package:firstproject/layout/shop_layout/cuibt/states.dart';
import 'package:firstproject/models/shop_app/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit , ShopAppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = ShopAppCubit.get(context) ;
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>buildCategoryItem(cubit.categoryModel.data.data[index]),
            separatorBuilder: (context,index)=>Divider(height: 1,color: Colors.grey,),
            itemCount: cubit.categoryModel.data.data.length
        );
      },
    );

  }

  Widget buildCategoryItem(DataModel dataModel)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(image: NetworkImage(dataModel.image) ,
          height: 120,width: 120,fit: BoxFit.fill,) ,
        SizedBox(width: 10,) ,
        Expanded(child: Text(dataModel.name ,overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),)) ,
        Icon(Icons.arrow_forward_ios) ,
      ],
    ),
  );
}
