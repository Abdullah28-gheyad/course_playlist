class ShopLoginModel
{
  bool status ;
  String message ;
  UserModel data ;
  ShopLoginModel({this.data , this.status,this.message});
  ShopLoginModel.fromJson(Map<String,dynamic>json)
  {
    status=json['status'];
    message=json['message'];
    data=json['data']!=null?UserModel.fromJson(json['data']):null;
  }
}
class UserModel
{
  int id ;
  String name ;
  String email ;
  String phone ;
  String image ;
  int points ;
  int credit ;
  String token ;
  UserModel({this.token,this.id,this.points,this.credit,this.name,this.image,this.phone,this.email});

  // named constructor
  UserModel.fromJson(Map<String , dynamic> json)
  {
    id= json['id'] ;
    name= json['name'] ;
    email= json['email'] ;
    phone= json['phone'] ;
    image= json['image'] ;
    points= json['points'] ;
    credit= json['credit'] ;
    token= json['token'] ;
  }
}