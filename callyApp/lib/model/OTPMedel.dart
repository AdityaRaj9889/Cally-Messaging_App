// To parse this JSON data, do
//
//     final getOtpModel = getOtpModelFromJson(jsonString);

import 'dart:convert';

GetOtpModel? getOtpModelFromJson(String str) =>
    GetOtpModel.fromJson(json.decode(str));

String getOtpModelToJson(GetOtpModel? data) => json.encode(data!.toJson());

class GetOtpModel {
  GetOtpModel({
    this.otp,
    this.msg,
    this.status,
  });

  int? otp;
  String? msg;
  bool? status;

  factory GetOtpModel.fromJson(Map<String, dynamic> json) => GetOtpModel(
        otp: json["otp"],
        msg: json["msg"] ?? "",
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "msg": msg,
        "status": status,
      };
}
