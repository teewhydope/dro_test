import 'dart:convert';
import 'package:dro_test/domain/entities/drug_products_entity.dart';

//     final welcome = welcomeFromJson(jsonString);
Map<String, DrugProductsModel> welcomeFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) =>
        MapEntry<String, DrugProductsModel>(k, DrugProductsModel.fromJson(v)));

String welcomeToJson(Map<String, DrugProductsModel> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class DrugProductsModel extends DrugProductsEntity {
  DrugProductsModel({
    required this.id,
    required this.description,
    required this.imageUrl,
    this.isFavorite,
    required this.mgQuantity,
    required this.price,
    required this.title,
    required this.quantity,
  }) : super(
          title: title,
          description: description,
          mgQuantity: mgQuantity,
          price: price,
          imageUrl: imageUrl,
          id: id,
          quantity: quantity,
        );
  final String id;
  final String description;
  final String imageUrl;
  final bool? isFavorite;
  final String mgQuantity;
  final int price;
  final String title;
  int quantity;

  factory DrugProductsModel.fromJson(Map<String, dynamic> json) =>
      DrugProductsModel(
        description: json["description"],
        id: json["id"],
        imageUrl: json["imageUrl"],
        isFavorite: json["isFavorite"],
        mgQuantity: json["mgQuantity"],
        price: json["price"],
        quantity: json["quantity"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "id": id,
        "imageUrl": imageUrl,
        "isFavorite": isFavorite,
        "mgQuantity": mgQuantity,
        "price": price,
        "quantity": quantity,
        "title": title,
      };
}
