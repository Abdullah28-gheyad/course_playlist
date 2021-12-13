class HomeModel {
  bool status;

  HomeModelData data;

  HomeModel({this.status, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeModelData.fromJson(json['data']);
  }
}

class HomeModelData {
  List<BannerModel> banners = [];
  List<ProductModel> products = [];

  HomeModelData({this.products, this.banners});

  HomeModelData.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((e) {
      banners.add(BannerModel.fromJson(e));
    });
    json['products'].forEach((e) {
      products.add(ProductModel.fromJson(e));
    });
  }
}

class BannerModel {
  int id;

  String image;

  BannerModel({this.id, this.image});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel {
  int id;

  dynamic price;

  dynamic oldPrice;

  int discount;

  String image;
  String name;
  String description;
  bool inFavorite;

  ProductModel(
      {this.image,
      this.id,
      this.price,
      this.inFavorite,
      this.name,
      this.discount,
      this.oldPrice,
      this.description});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    inFavorite = json['in_favorites'];
  }
}
