// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

RegistrationModel registrationModelFromJson(String str) => RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) => json.encode(data.toJson());

class RegistrationModel {
    RegistrationModel({
        required this.userId,
        required this.userName,
        required this.mobile,
        required this.email,
        required this.securityPin,
        required this.msg,
        required this.status,
    });

    int userId;
    String userName;
    String mobile;
    String email;
    String securityPin;
    String msg;
    bool status;

    factory RegistrationModel.fromJson(Map<String, dynamic> json) => RegistrationModel(
        userId: json["user_id"] ?? '',
        userName: json["user_name"] ?? '',
        mobile: json["mobile"] ?? '',
        email: json["email"] ?? '',
        securityPin: json["security_pin"] ?? '',
        msg: json["msg"] ?? '',
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "mobile": mobile,
        "email": email,
        "security_pin": securityPin,
        "msg": msg,
        "status": status,
    };
}
