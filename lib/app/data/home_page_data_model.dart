// To parse this JSON data, do
//
//     final homePageDataModel = homePageDataModelFromJson(jsonString);

import 'dart:convert';

HomePageDataModel homePageDataModelFromJson(String str) =>
    HomePageDataModel.fromJson(json.decode(str));

String homePageDataModelToJson(HomePageDataModel data) =>
    json.encode(data.toJson());

class HomePageDataModel {
  HomePageDataModel({
    this.sliderImages,
    this.categories,
    this.recentOrder,
    this.seasonalProducts,
  });

  factory HomePageDataModel.fromJson(Map<String, dynamic> json) =>
      HomePageDataModel(
        sliderImages: json['slider_images'] == null
            ? <String>[]
            : List<String>.from(json['slider_images']!.map((x) => x)),
        categories: json['categories'] == null
            ? <Category>[]
            : List<Category>.from(
                json['categories']!.map((x) => Category.fromJson(x)),
              ),
        recentOrder: json['recent_order'] == null
            ? <Product>[]
            : List<Product>.from(
                json['recent_order']!.map((x) => Product.fromJson(x)),
              ),
        seasonalProducts: json['seasonal_products'] == null
            ? <Product>[]
            : List<Product>.from(
                json['seasonal_products']!.map((x) => Product.fromJson(x)),
              ),
      );
  final List<String>? sliderImages;
  final List<Category>? categories;
  final List<Product>? recentOrder;
  final List<Product>? seasonalProducts;

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

  Map<String, dynamic> toJson() => <String, dynamic>{
        'slider_images': sliderImages == null
            ? <String>[]
            : List<dynamic>.from(sliderImages!.map((String x) => x)),
        'categories': categories == null
            ? <Category>[]
            : List<dynamic>.from(categories!.map((Category x) => x.toJson())),
        'recent_order': recentOrder == null
            ? <Product>[]
            : List<dynamic>.from(recentOrder!.map((Product x) => x.toJson())),
        'seasonal_products': seasonalProducts == null
            ? <Product>[]
            : List<dynamic>.from(
                seasonalProducts!.map((Product x) => x.toJson()),
              ),
      };
}

class Category {
  Category({
    this.title,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        title: json['title'],
        image: json['image'],
      );
  final String? title;
  final String? image;

  Category copyWith({
    String? title,
    String? image,
  }) =>
      Category(
        title: title ?? this.title,
        image: image ?? this.image,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'image': image,
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.weight = '1kg',
    this.price,
    this.image,
    this.description,
    this.quantity = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        weight: json['weight'],
        price: json['price'],
        image: json['image'],
        description: json['description'],
        quantity: json['quantity'],
      );
  final int? id;
  final String? name;
  final String weight;
  final String? price;
  final String? image;
  final String? description;
  int quantity;

  Product copyWith({
    int? id,
    String? name,
    String? weight,
    String? price,
    String? image,
    String? description,
    int? quantity,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        weight: weight ?? this.weight,
        price: price ?? this.price,
        image: image ?? this.image,
        description: description ?? this.description,
        quantity: quantity ?? this.quantity,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'weight': weight,
        'price': price,
        'image': image,
        'description': description,
        'quantity': quantity,
      };
}
