class ChangeFavoriteModel
{
  bool status ;
  String message ;
  ChangeFavoriteModel({this.status,this.message}) ;
  ChangeFavoriteModel.fromJson(Map<String,dynamic> json)
  {
    status = json['status'] ;
    message = json['message'] ;
  }
}