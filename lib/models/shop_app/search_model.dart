class SearchModel
{
  bool status ;
  ProductDataModel data ;
  SearchModel({this.data,this.status}) ;
  SearchModel.fromJson(Map<String,dynamic>json)
  {
    status = json['status'] ;
    data = ProductDataModel.fromJson(json['data']) ;
  }
}
class ProductDataModel
{
  int currentPage ;
  List <SearchProductModel> data=[] ;
  ProductDataModel({this.data,this.currentPage});
  ProductDataModel.fromJson(Map<String , dynamic>json)
  {
    currentPage = json['current_page'] ;
    json['data'].forEach((e){
      data.add(SearchProductModel.fromJson(e)) ;
    }) ;
  }
}
class SearchProductModel
{
  int id ;
  num price ;
  String image ;
  String name ;
  String description ;
  bool inFavorites ;
  SearchProductModel({this.name,this.id,this.price,this.image,this.description,this.inFavorites}) ;
  SearchProductModel.fromJson(Map <String ,dynamic> json)
  {
    id = json['id'] ;
    price =json['price'] ;
    image = json['image'] ;
    name = json['name'] ;
    description = json['description'] ;
    inFavorites = json['in_favorites'] ;
  }
}