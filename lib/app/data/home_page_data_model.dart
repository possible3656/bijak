// To parse this JSON data, do
//
//     final homePageDataModel = homePageDataModelFromJson(jsonString);

import 'dart:convert';

HomePageDataModel homePageDataModelFromJson(String str) =>
    HomePageDataModel.fromJson(json.decode(str));

String homePageDataModelToJson(HomePageDataModel data) =>
    json.encode(data.toJson());

class HomePageDataModel {
  final List<String>? sliderImages;
  final List<Category>? categories;
  final List<Product>? recentOrder;
  final List<Product>? seasonalProducts;

  HomePageDataModel({
    this.sliderImages,
    this.categories,
    this.recentOrder,
    this.seasonalProducts,
  });

  HomePageDataModel copyWith({
    List<String>? sliderImages,
    List<Category>? categories,
    List<Product>? recentOrder,
    List<Product>? seasonalProducts,
  }) =>
      HomePageDataModel(
        sliderImages: sliderImages ?? this.sliderImages,
        categories: categories ?? this.categories,
        recentOrder: recentOrder ?? this.recentOrder,
        seasonalProducts: seasonalProducts ?? this.seasonalProducts,
      );

  factory HomePageDataModel.fromJson(Map<String, dynamic> json) =>
      HomePageDataModel(
        sliderImages: json["slider_images"] == null
            ? []
            : List<String>.from(json["slider_images"]!.map((x) => x)),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        recentOrder: json["recent_order"] == null
            ? []
            : List<Product>.from(
                json["recent_order"]!.map((x) => Product.fromJson(x))),
        seasonalProducts: json["seasonal_products"] == null
            ? []
            : List<Product>.from(
                json["seasonal_products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "slider_images": sliderImages == null
            ? []
            : List<dynamic>.from(sliderImages!.map((x) => x)),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "recent_order": recentOrder == null
            ? []
            : List<dynamic>.from(recentOrder!.map((x) => x.toJson())),
        "seasonal_products": seasonalProducts == null
            ? []
            : List<dynamic>.from(seasonalProducts!.map((x) => x.toJson())),
      };
}

class Category {
  final String? title;
  final String? image;

  Category({
    this.title,
    this.image,
  });

  Category copyWith({
    String? title,
    String? image,
  }) =>
      Category(
        title: title ?? this.title,
        image: image ?? this.image,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
      };
}

class Product {
  final String? name;
  final String? weight;
  final String? price;
  final String? image;
  final int? quantity;

  Product({
    this.name,
    this.weight,
    this.price,
    this.image,
    this.quantity,
  });

  Product copyWith({
    String? name,
    String? weight,
    String? price,
    String? image,
    int? quantity,
  }) =>
      Product(
        name: name ?? this.name,
        weight: weight ?? this.weight,
        price: price ?? this.price,
        image: image ?? this.image,
        quantity: quantity ?? this.quantity,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        weight: json["weight"],
        price: json["price"],
        image: json["image"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "weight": weight,
        "price": price,
        "image": image,
        "quantity": quantity,
      };
}
