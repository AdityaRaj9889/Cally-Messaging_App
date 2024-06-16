// To parse this JSON data, do
//
//     final getProfileDataModel = getProfileDataModelFromJson(jsonString);

import 'dart:convert';

GetProfileDataModel getProfileDataModelFromJson(String str) => GetProfileDataModel.fromJson(json.decode(str));

String getProfileDataModelToJson(GetProfileDataModel data) => json.encode(data.toJson());

class GetProfileDataModel {
    GetProfileDataModel({
        required this.profile,
        required this.msg,
        required this.status,
    });

    List<UserProfile> profile;
    String msg;
    bool status;

    factory GetProfileDataModel.fromJson(Map<String, dynamic> json) => GetProfileDataModel(
        profile: List<UserProfile>.from(json["profile"].map((x) => UserProfile.fromJson(x))),
        msg: json["msg"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "profile": List<dynamic>.from(profile.map((x) => x.toJson())),
        "msg": msg,
        "status": status,
    };
}

class UserProfile {
    UserProfile({
        required this.userId,
        required this.userName,
        required this.email,
        required this.mobile,
        required this.password,
        required this.securityPin,
        required this.walletBalance,
        required this.holdAmount,
        required this.lastUpdate,
        required this.insertDate,
        required this.status,
        required this.bettingStatus,
        required this.notificationStatus,
        required this.transferPointStatus,
    });

    String userId;
    String userName;
    String email;
    String mobile;
    String password;
    String securityPin;
    String walletBalance;
    String holdAmount;
    DateTime lastUpdate;
    String insertDate;
    String status;
    String bettingStatus;
    String notificationStatus;
    String transferPointStatus;

    factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        userId: json["user_id"] ?? '',
        userName: json["user_name"] ?? '',
        email: json["email"] ?? '',
        mobile: json["mobile"] ?? '',
        password: json["password"],
        securityPin: json["security_pin"] ?? '',
        walletBalance: json["wallet_balance"] ?? '',
        holdAmount: json["hold_amount"] ?? '',
        lastUpdate: DateTime.parse(json["last_update"]),
        insertDate: json["insert_date"] ?? '',
        status: json["status"] ?? '',
        bettingStatus: json["betting_status"] ?? '',
        notificationStatus: json["notification_status"] ?? '',
        transferPointStatus: json["transfer_point_status"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "email": email,
        "mobile": mobile,
        "password": password,
        "security_pin": securityPin,
        "wallet_balance": walletBalance,
        "hold_amount": holdAmount,
        "last_update": lastUpdate.toIso8601String(),
        "insert_date": insertDate,
        "status": status,
        "betting_status": bettingStatus,
        "notification_status": notificationStatus,
        "transfer_point_status": transferPointStatus,
    };
}


// To parse this JSON data, do
//
//     final updateProfileModel = updateProfileModelFromJson(jsonString);


UpdateProfileModel updateProfileModelFromJson(String str) => UpdateProfileModel.fromJson(json.decode(str));

String updateProfileModelToJson(UpdateProfileModel data) => json.encode(data.toJson());

class UpdateProfileModel {
    UpdateProfileModel({
        required this.msg,
        required this.status,
    });

    String msg;
    bool status;

    factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
        msg: json["msg"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
    };
}

