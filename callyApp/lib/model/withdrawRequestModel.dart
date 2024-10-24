// To parse this JSON data, do
//
//     final withdrawrequestModel = withdrawrequestModelFromJson(jsonString);

import 'dart:convert';

WithdrawrequestModel withdrawrequestModelFromJson(String str) =>
    WithdrawrequestModel.fromJson(json.decode(str));

String withdrawrequestModelToJson(WithdrawrequestModel data) =>
    json.encode(data.toJson());

class WithdrawrequestModel {
  WithdrawrequestModel({
    required this.msg,
    required this.fundRequestId,
    required this.status,
  });

  String msg;
  int fundRequestId;
  bool status;

  factory WithdrawrequestModel.fromJson(Map<String, dynamic> json) =>
      WithdrawrequestModel(
        msg: json["msg"],
        fundRequestId: json["fund_request_id"] ?? 0,
        status: json["status"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "fund_request_id": fundRequestId,
        "status": status,
      };
}
