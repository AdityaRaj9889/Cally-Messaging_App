// To parse this JSON data, do
//
//     final getUserPaymentListModel = getUserPaymentListModelFromJson(jsonString);

import 'dart:convert';

GetUserPaymentListModel getUserPaymentListModelFromJson(String str) => GetUserPaymentListModel.fromJson(json.decode(str));

String getUserPaymentListModelToJson(GetUserPaymentListModel data) => json.encode(data.toJson());

class GetUserPaymentListModel {
    GetUserPaymentListModel({
        required this.result,
        required this.minAmt,
        required this.msg,
        required this.status,
    });

    List<PaymentResult> result;
    String minAmt;
    String msg;
    bool status;

    factory GetUserPaymentListModel.fromJson(Map<String, dynamic> json) => GetUserPaymentListModel(
        result: List<PaymentResult>.from(json["result"].map((x) =>PaymentResult.fromJson(x))),
        minAmt: json["min_amt"] ?? '',
        msg: json["msg"] ?? '',
        status: json["status"] ?? false,
    );

    Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "min_amt": minAmt,
        "msg": msg,
        "status": status,
    };
}

class PaymentResult {
    PaymentResult({
        required this.type,
        required this.value,
        required this.name,
    });

    int type;
    String value;
    String name;

    factory PaymentResult.fromJson(Map<String, dynamic> json) => PaymentResult(
        type: json["type"],
        value: json["value"] ?? '',
        name: json["name"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
        "name": name,
    };
}
