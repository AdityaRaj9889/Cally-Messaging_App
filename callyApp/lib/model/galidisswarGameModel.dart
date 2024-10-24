// To parse this JSON data, do
//
//     final galidisswarGameModel = galidisswarGameModelFromJson(jsonString);

import 'dart:convert';

GalidisswarGameModel galidisswarGameModelFromJson(String str) =>
    GalidisswarGameModel.fromJson(json.decode(str));

String galidisswarGameModelToJson(GalidisswarGameModel data) =>
    json.encode(data.toJson());

class GalidisswarGameModel {
  GalidisswarGameModel({
    required this.webGaliDisswarChartUrl,
    required this.result,
  });

  String webGaliDisswarChartUrl;
  List<GaliDesawerGame> result;

  factory GalidisswarGameModel.fromJson(Map<String, dynamic> json) =>
      GalidisswarGameModel(
        webGaliDisswarChartUrl: json["web_gali_disswar_chart_url"],
        result: json["result"] == null
            ? []
            : List<GaliDesawerGame>.from(
                json["result"].map((x) => GaliDesawerGame.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "web_gali_disswar_chart_url": webGaliDisswarChartUrl,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class GaliDesawerGame {
  GaliDesawerGame({
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

  factory GaliDesawerGame.fromJson(Map<String, dynamic> json) =>
      GaliDesawerGame(
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
