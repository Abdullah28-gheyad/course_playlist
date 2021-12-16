class CategoryModel
{
  bool status ;
  CategoryDataModel data ;
  CategoryModel({this.data,this.status}) ;
  CategoryModel.fromJson(Map<String,dynamic>json)
  {
    status = json['status'] ;
    data = CategoryDataModel.fromJson(json['data']) ;
  }
}
class CategoryDataModel
{
  int currentPage ;
  List <DataModel> data  = [];
  CategoryDataModel({this.data,this.currentPage}) ;
  CategoryDataModel.fromJson(Map<String,dynamic> json)
  {
    currentPage = json['current_page'] ;
    json['data'].forEach((e)
    {
      data.add(DataModel.fromJson(e)) ;
    }) ;
  }
}
class DataModel
{
  int id ;
  String name ;
  String image ;
  DataModel({this.id,this.image,this.name}) ;
  DataModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'] ;
    name = json['name'] ;
    image = json['image'] ;
  }
}