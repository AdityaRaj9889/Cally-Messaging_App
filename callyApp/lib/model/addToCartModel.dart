// To parse this JSON data, do
//
//     final productAddToCartModel = productAddToCartModelFromJson(jsonString);

import 'dart:convert';

ProductAddToCartModel productAddToCartModelFromJson(String str) => ProductAddToCartModel.fromJson(json.decode(str));

String productAddToCartModelToJson(ProductAddToCartModel data) => json.encode(data.toJson());

class ProductAddToCartModel {
    ProductAddToCartModel({
        required this.status,
        required this.statusMessage,
        required this.data,
    });

    int status;
    String statusMessage;
    String data;

    factory ProductAddToCartModel.fromJson(Map<String, dynamic> json) => ProductAddToCartModel(
        status: json["status"],
        statusMessage: json["status_message"] ?? '',
        data: json["data"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "status_message": statusMessage,
        "data": data,
    };
}
