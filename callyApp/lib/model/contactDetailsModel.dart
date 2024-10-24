// To parse this JSON data, do
//
//     final contactDetailsModel = contactDetailsModelFromJson(jsonString);

import 'dart:convert';

ContactDetailsModel contactDetailsModelFromJson(String str) => ContactDetailsModel.fromJson(json.decode(str));

String contactDetailsModelToJson(ContactDetailsModel data) => json.encode(data.toJson());

class ContactDetailsModel {
    ContactDetailsModel({
        required this.mobile1,
        required this.mobile2,
        required this.whatsappNo,
        required this.email1,
        required this.email2,
        required this.facebook,
        required this.twitter,
        required this.youtube,
        required this.googlePlus,
        required this.instagram,
        required this.msg,
        required this.status,
    });

    String mobile1;
    String mobile2;
    String whatsappNo;
    String email1;
    String email2;
    String facebook;
    String twitter;
    String youtube;
    String googlePlus;
    String instagram;
    String msg;
    bool status;

    factory ContactDetailsModel.fromJson(Map<String, dynamic> json) => ContactDetailsModel(
        mobile1: json["mobile_1"] ?? "",
        mobile2: json["mobile_2"] ?? "",
        whatsappNo: json["whatsapp_no"] ?? "",
        email1: json["email_1"] ?? "",
        email2: json["email_2"] ?? "",
        facebook: json["facebook"] ?? "",
        twitter: json["twitter"] ?? "",
        youtube: json["youtube"] ?? "",
        googlePlus: json["google_plus"] ?? "",
        instagram: json["instagram"] ?? "",
        msg: json["msg"] ?? "",
        status: json["status"] ?? false,
    );

    Map<String, dynamic> toJson() => {
        "mobile_1": mobile1,
        "mobile_2": mobile2,
        "whatsapp_no": whatsappNo,
        "email_1": email1,
        "email_2": email2,
        "facebook": facebook,
        "twitter": twitter,
        "youtube": youtube,
        "google_plus": googlePlus,
        "instagram": instagram,
        "msg": msg,
        "status": status,
    };
}
