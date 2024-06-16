// To parse this JSON data, do
//
//     final addPointModel = addPointModelFromJson(jsonString);

import 'dart:convert';

AddPointModel addPointModelFromJson(String str) =>
    AddPointModel.fromJson(json.decode(str));

String addPointModelToJson(AddPointModel data) => json.encode(data.toJson());

class AddPointModel {
  AddPointModel({
    required this.msg,
    required this.status,
  });

  String msg;
  bool status;

  factory AddPointModel.fromJson(Map<String, dynamic> json) => AddPointModel(
        msg: json["msg"] ?? '',
        status: json["status"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
      };
}
