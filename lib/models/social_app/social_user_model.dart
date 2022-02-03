class SocialUserModel
{
  String uId ;
  String name ;
  String password ;
  String email ;
  String phone ;
  SocialUserModel({this.password,this.email,this.name,this.phone,this.uId});
  SocialUserModel.fromJson(Map<String,dynamic>json)
  {
    uId=json['uId'];
    name=json['name'];
    password=json['password'];
    email=json['email'];
    phone=json['phone'];
  }

  Map<String,dynamic> toMap()
  {
    return {
      'name':name ,
      'email':email ,
      'phone':phone ,
      'password':password ,
      'uId':uId ,
    } ;
  }

}