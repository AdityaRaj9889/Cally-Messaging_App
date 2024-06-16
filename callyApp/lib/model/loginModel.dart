// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel? loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel? data) => json.encode(data!.toJson());

class LoginModel {
  LoginModel({
    this.msg,
    this.userId,
    this.userName,
    this.mobile,
    this.notificationStatus,
    this.email,
    this.mobileNo,
    this.securityPin,
    this.bettingStatus,
    this.status,
  });

  String? msg;
  String? userId;
  String? userName;
  String? mobile;
  String? notificationStatus;
  String? email;
  String? mobileNo;
  String? securityPin;
  String? bettingStatus;
  bool? status;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        msg: json["msg"] ?? "",
        userId: json["user_id"] ?? "",
        userName: json["user_name"] ?? "",
        mobile: json["mobile"] ?? "",
        notificationStatus: json["notification_status"] ?? "",
        email: json["email"] ?? "",
        mobileNo: json["mobile_no"] ?? "",
        securityPin: json["security_pin"] ?? "",
        bettingStatus: json["betting_status"] ?? "",
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "user_id": userId,
        "user_name": userName,
        "mobile": mobile,
        "notification_status": notificationStatus,
        "email": email,
        "mobile_no": mobileNo,
        "security_pin": securityPin,
        "betting_status": bettingStatus,
        "status": status,
      };
}
