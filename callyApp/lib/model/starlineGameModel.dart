// To parse this JSON data, do
//
//     final startlineGameListModel = startlineGameListModelFromJson(jsonString);

import 'dart:convert';

StartlineGameListModel startlineGameListModelFromJson(String str) => StartlineGameListModel.fromJson(json.decode(str));

String startlineGameListModelToJson(StartlineGameListModel data) => json.encode(data.toJson());

class StartlineGameListModel {
    StartlineGameListModel({
        required this.webStarlineChartUrl,
        required this.result,
    });

    String webStarlineChartUrl;
    List<StartLineGame> result;

    factory StartlineGameListModel.fromJson(Map<String, dynamic> json) => StartlineGameListModel(
        webStarlineChartUrl: json["web_starline_chart_url"],
        result: List<StartLineGame>.from(json["result"].map((x) => StartLineGame.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "web_starline_chart_url": webStarlineChartUrl,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class StartLineGame {
    StartLineGame({
        required this.gameId,
        required this.gameName,
        required this.gameNameHindi,
        required this.openTime,
        required this.openTimeSort,
        required this.closeTime,
        required this.msg,
        required this.msgStatus,
        required this.openResult,
        required this.closeResult,
    });

    String gameId;
    String gameName;
    String gameNameHindi;
    String openTime;
    String openTimeSort;
    String closeTime;
    String msg;
    int msgStatus;
    String openResult;
    String closeResult;

    factory StartLineGame.fromJson(Map<String, dynamic> json) => StartLineGame(
        gameId: json["game_id"],
        gameName: json["game_name"],
        gameNameHindi: json["game_name_hindi"],
        openTime: json["open_time"],
        openTimeSort: json["open_time_sort"],
        closeTime: json["close_time"],
        msg: json["msg"],
        msgStatus: json["msg_status"],
        openResult: json["open_result"],
        closeResult: json["close_result"],
    );

    Map<String, dynamic> toJson() => {
        "game_id": gameId,
        "game_name": gameName,
        "game_name_hindi": gameNameHindi,
        "open_time": openTime,
        "open_time_sort": openTimeSort,
        "close_time": closeTime,
        "msg": msg,
        "msg_status": msgStatus,
        "open_result": openResult,
        "close_result": closeResult,
    };
}
