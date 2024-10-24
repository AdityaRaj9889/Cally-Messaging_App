// To parse this JSON data, do
//
//     final getOrderProductModel = getOrderProductModelFromJson(jsonString);

import 'dart:convert';

GetOrderProductModel getOrderProductModelFromJson(String str) => GetOrderProductModel.fromJson(json.decode(str));

String getOrderProductModelToJson(GetOrderProductModel data) => json.encode(data.toJson());

class GetOrderProductModel {
    GetOrderProductModel({
        required this.status,
        required this.statusMessage,
        required this.data,
    });

    int status;
    String statusMessage;
    List<OrderProduct> data;

    factory GetOrderProductModel.fromJson(Map<String, dynamic> json) => GetOrderProductModel(
        status: json["status"],
        statusMessage: json["status_message"],
        data: json["data"] == '' ? [] : List<OrderProduct>.from(json["data"].map((x) => OrderProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "status_message": statusMessage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class OrderProduct {
    OrderProduct({
        required this.orderId,
        required this.address,
        required this.orderDateTime,
        required this.txnNum,
        required this.paymentStatus,
        required this.deliveryStatus,
        required this.productsOrders,
    });

    String orderId;
    String address;
    String orderDateTime;
    String txnNum;
    String paymentStatus;
    String deliveryStatus;
    List<Products> productsOrders;

    factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
        orderId: json["orderId"] ?? '',
        address: json["address"] ?? '',
        orderDateTime: json["orderDateTime"] ?? '',
        txnNum: json["txnNum"] ?? '',
        paymentStatus: json["paymentStatus"] ?? '',
        deliveryStatus: json["deliveryStatus"] ?? '',
        productsOrders: json["productsOrders"] == '' ? [] : List<Products>.from(json["productsOrders"].map((x) => Products.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "address": address,
        "orderDateTime": orderDateTime,
        "txnNum": txnNum,
        "paymentStatus": paymentStatus,
        "deliveryStatus": deliveryStatus,
        "productsOrders": List<dynamic>.from(productsOrders.map((x) => x.toJson())),
    };
}

class Products {
    Products({
        required this.productName,
        required this.qty,
    });

    String productName;
    String qty;

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        productName: json["productName"] ?? '',
        qty: json["qty"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "productName": productName,
        "qty": qty,
    };
}
