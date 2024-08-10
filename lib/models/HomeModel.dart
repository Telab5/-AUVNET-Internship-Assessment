import 'dart:convert';

class Homemodel {
  bool? status;
  HomeDataModel? data;

  Homemodel.fromjson(Map<dynamic, dynamic> json) {
    status = json['status'];
    data = HomeDataModel.fromjson(json['data']);
  }
}

class HomeDataModel {
  List<bannarModel>? bannars;
  List<ProductModel>? products;
  HomeDataModel.fromjson(Map<dynamic, dynamic> json) {
    json['banners'].forEach((ele) {
      bannars!.add(ele);
    });
  }
}

class bannarModel {
  int? id;
  String? image;

  bannarModel.fromjson(Map<dynamic, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel {
  int? id;
  int? price;
  int? old_price;
  int? discount;
  String? image;
  String? name;
  String? in_favorites;
  String? in_cart;

  ProductModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    in_favorites = json['in_favorites'];
    in_cart = json['in_cart'];
  }
}
