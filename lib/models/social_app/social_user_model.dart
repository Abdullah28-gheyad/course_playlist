class SocialUserModel
{
  String uId ;
  String name ;
  String password ;
  String email ;
  String phone ;
  String image ;
  String cover ;
  String bio ;
  SocialUserModel({this.password,this.email,this.name,this.phone,this.uId,this.cover,this.image,this.bio});
  SocialUserModel.fromJson(Map<String,dynamic>json)
  {
    uId=json['uId'];
    name=json['name'];
    password=json['password'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    cover=json['cover'];
    bio=json['bio'];
  }

  Map<String,dynamic> toMap()
  {
    return {
      'name':name ,
      'email':email ,
      'phone':phone ,
      'password':password ,
      'uId':uId ,
      'image':image ,
      'cover':cover ,
      'bio':bio ,
    } ;
  }

}