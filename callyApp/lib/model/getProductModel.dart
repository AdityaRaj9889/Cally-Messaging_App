// To parse this JSON data, do
//
//     final getProductModel = getProductModelFromJson(jsonString);

import 'dart:convert';

GetProductModel getProductModelFromJson(String str) => GetProductModel.fromJson(json.decode(str));

String getProductModelToJson(GetProductModel data) => json.encode(data.toJson());

class GetProductModel {
    GetProductModel({
        required this.status,
        required this.statusMessage,
        required this.data,
    });

    int status;
    String statusMessage;
    List<Product> data;

    factory GetProductModel.fromJson(Map<String, dynamic> json) => GetProductModel(
        status: json["status"],
        statusMessage: json["status_message"],
        data: json["data"] == '' ? [] : List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "status_message": statusMessage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        required this.productId,
        required this.name,
        required this.category,
        required this.subcategory,
        required this.imgurl,
        required this.description,
        required this.size,
        required this.unit,
        required this.mrp,
        required this.sellingPrice,
    });

    String productId;
    String name;
    String category;
    String subcategory;
    String imgurl;
    String description;
    String size;
    String unit;
    String mrp;
    String sellingPrice;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"] ?? '',
        name: json["name"] ?? '',
        category: json["category"] ?? '',
        subcategory: json["subcategory"] ?? '',
        imgurl: json["imgurl"] ?? '',
        description: json["description"] ?? '',
        size: json["size"] ?? '',
        unit: json["unit"] ?? '',
        mrp: json["mrp"] ?? '',
        sellingPrice: json["selling_price"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": name,
        "category": category,
        "subcategory": subcategory,
        "imgurl": imgurl,
        "description": description,
        "size": size,
        "unit": unit,
        "mrp": mrp,
        "selling_price": sellingPrice,
    };
}
