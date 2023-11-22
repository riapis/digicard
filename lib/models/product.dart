// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  String model;
  int pk;
  Fields fields;

  Product({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String type;
  String name;
  String element;
  int amount;
  int power;
  String description;

  Fields({
    required this.user,
    required this.type,
    required this.name,
    required this.element,
    required this.amount,
    required this.power,
    required this.description,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        type: json["type"],
        name: json["name"],
        element: json["element"],
        amount: json["amount"],
        power: json["power"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "type": type,
        "name": name,
        "element": element,
        "amount": amount,
        "power": power,
        "description": description,
      };
}
