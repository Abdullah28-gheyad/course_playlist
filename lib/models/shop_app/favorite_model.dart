import 'package:firstproject/models/shop_app/home_model.dart';

class FavoriteModel {
  bool status;
  FavoriteDataModel data;
  FavoriteModel({this.data,this.status}) ;
  FavoriteModel.fromJson(Map<String,dynamic>json)
  {
    status = json['status'] ;
    data = FavoriteDataModel.fromJson(json['data']) ;
  }
}

class FavoriteDataModel {
  int currentPage;
  List <Data> data=[];
  FavoriteDataModel({this.data,this.currentPage}) ;
  FavoriteDataModel.fromJson(Map<String,dynamic>json)
  {
    currentPage = json['current_page'];
    json['data'].forEach((e){
      data.add(Data.fromJson(e)) ;
    }) ;
  }
}
class Data
{
  int id ;
  ProductModel productModel ;
  Data({this.productModel,this.id});
  Data.fromJson(Map<String,dynamic>json)
  {
    id = json['id'] ;
    productModel = ProductModel.fromJson(json['product']) ;
  }
}
