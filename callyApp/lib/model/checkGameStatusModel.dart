// To parse this JSON data, do
//
//     final checkGameStatusModel = checkGameStatusModelFromJson(jsonString);

import 'dart:convert';

CheckGameStatusModel checkGameStatusModelFromJson(String str) => CheckGameStatusModel.fromJson(json.decode(str));

String checkGameStatusModelToJson(CheckGameStatusModel data) => json.encode(data.toJson());

class CheckGameStatusModel {
    CheckGameStatusModel({
        required this.msg,
        required this.gameStatus,
        required this.status,
    });

    String msg;
    int gameStatus;
    bool status;

    factory CheckGameStatusModel.fromJson(Map<String, dynamic> json) => CheckGameStatusModel(
        msg: json["msg"] ?? '',
        gameStatus: json["game_status"] ?? '',
        status: json["status"] ?? false,
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "game_status": gameStatus,
        "status": status,
    };
}
