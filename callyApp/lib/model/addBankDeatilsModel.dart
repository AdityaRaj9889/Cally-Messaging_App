// To parse this JSON data, do
//
//     final addBankDetailsModel = addBankDetailsModelFromJson(jsonString);

import 'dart:convert';

AddBankDetailsModel addBankDetailsModelFromJson(String str) => AddBankDetailsModel.fromJson(json.decode(str));

String addBankDetailsModelToJson(AddBankDetailsModel data) => json.encode(data.toJson());

class AddBankDetailsModel {
    AddBankDetailsModel({
        required this.msg,
        required this.status,
    });

    String msg;
    bool status;

    factory AddBankDetailsModel.fromJson(Map<String, dynamic> json) => AddBankDetailsModel(
        msg: json["msg"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
    };
}
