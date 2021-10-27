// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Product {
  Product(
      {required this.available,
      required this.name,
      this.picture,
      required this.price,
      this.id,
      this.phone,
      this.description});

  bool available;
  String name;
  String? picture;
  double price;
  String? id;
  String? phone;
  String? description;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
      available: json["available"],
      name: json["name"],
      picture: json["picture"],
      price: json["price"].toDouble(),
      phone: json["phone"],
      description: json["description"]);

  Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
        "phone": phone,
        "description": description
      };

  Product copy() => Product(
        available: this.available,
        name: this.name,
        picture: this.picture,
        price: this.price,
        id: this.id,
        description: this.description,
        phone: this.phone
      );
}
