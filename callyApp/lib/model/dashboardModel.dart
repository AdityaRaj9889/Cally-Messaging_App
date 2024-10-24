// To parse this JSON data, do
//
//     final getDashboardDataModel = getDashboardDataModelFromJson(jsonString);

import 'dart:convert';

GetDashboardDataModel getDashboardDataModelFromJson(String str) => GetDashboardDataModel.fromJson(json.decode(str));

String getDashboardDataModelToJson(GetDashboardDataModel data) => json.encode(data.toJson());

class GetDashboardDataModel {
    GetDashboardDataModel({
        required this.appLink,
        required this.shareMsg,
        required this.withdrawStatus,
        required this.userCurrentVersion,
        required this.userMinimumVersion,
        required this.popStatus,
        required this.message,
        required this.link,
        required this.linkBtnText,
        required this.actionType,
        required this.actionBtnText,
        required this.appDate,
        required this.walletAmt,
        required this.transferPointStatus,
        required this.bettingStatus,
        required this.accountBlockStatus,
        required this.rouletteShowStatus,
        required this.result,
        required this.mobileNo,
        required this.msg,
        required this.status,
    });

    String appLink;
    String shareMsg;
    int withdrawStatus;
    String userCurrentVersion;
    String userMinimumVersion;
    String popStatus;
    String message;
    String link;
    String linkBtnText;
    String actionType;
    String actionBtnText;
    String appDate;
    String walletAmt;
    String transferPointStatus;
    String bettingStatus;
    String accountBlockStatus;
    int rouletteShowStatus;
    List<GameList> result;
    String mobileNo;
    String msg;
    bool status;

    factory GetDashboardDataModel.fromJson(Map<String, dynamic> json) => GetDashboardDataModel(
        appLink: json["app_link"] ?? '',
        shareMsg: json["share_msg"] ?? '',
        withdrawStatus: json["withdraw_status"],
        userCurrentVersion: json["user_current_version"] ?? '',
        userMinimumVersion: json["user_minimum_version"] ?? '',
        popStatus: json["pop_status"] ?? '',
        message: json["message"] ?? '',
        link: json["link"] ?? '',
        linkBtnText: json["link_btn_text"] ?? '',
        actionType: json["action_type"] ?? '',
        actionBtnText: json["action_btn_text"] ?? '',
        appDate: json["app_date"] ?? '',
        walletAmt: json["wallet_amt"] ?? '',
        transferPointStatus: json["transfer_point_status"] ?? '',
        bettingStatus: json["betting_status"] ?? '',
        accountBlockStatus: json["account_block_status"] ?? '',
        rouletteShowStatus: json["roulette_show_status"],
        result: json["result"] == null ? [] : List<GameList>.from(json["result"].map((x) => GameList.fromJson(x))),
        mobileNo: json["mobile_no"] ?? '',
        msg: json["msg"] ?? '',
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "app_link": appLink,
        "share_msg": shareMsg,
        "withdraw_status": withdrawStatus,
        "user_current_version": userCurrentVersion,
        "user_minimum_version": userMinimumVersion,
        "pop_status": popStatus,
        "message": message,
        "link": link,
        "link_btn_text": linkBtnText,
        "action_type": actionType,
        "action_btn_text": actionBtnText,
        "app_date": appDate,
        "wallet_amt": walletAmt,
        "transfer_point_status": transferPointStatus,
        "betting_status": bettingStatus,
        "account_block_status": accountBlockStatus,
        "roulette_show_status": rouletteShowStatus,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "mobile_no": mobileNo,
        "msg": msg,
        "status": status,
    };
}

class GameList {
    GameList({
        required this.gameId,
        required this.gameName,
        required this.gameNameHindi,
        required this.openTime,
        required this.openTimeSort,
        required this.closeTime,
        required this.marketOffDay,
        required this.gameNameLetter,
        required this.msg,
        required this.msgStatus,
        required this.openResult,
        required this.closeResult,
        required this.webChartUrl,
    });

    String gameId;
    String gameName;
    String gameNameHindi;
    String openTime;
    String openTimeSort;
    String closeTime;
    String marketOffDay;
    String gameNameLetter;
    String msg;
    int msgStatus;
    String openResult;
    String closeResult;
    String webChartUrl;

    factory GameList.fromJson(Map<String, dynamic> json) => GameList(
        gameId: json["game_id"],
        gameName: json["game_name"],
        gameNameHindi: json["game_name_hindi"],
        openTime: json["open_time"],
        openTimeSort: json["open_time_sort"],
        closeTime: json["close_time"],
        marketOffDay: json["market_off_day"],
        gameNameLetter: json["game_name_letter"],
        msg: json["msg"],
        msgStatus: json["msg_status"],
        openResult: json["open_result"],
        closeResult: json["close_result"],
        webChartUrl: json["web_chart_url"],
    );

    Map<String, dynamic> toJson() => {
        "game_id": gameId,
        "game_name": gameName,
        "game_name_hindi": gameNameHindi,
        "open_time": openTime,
        "open_time_sort": openTimeSort,
        "close_time": closeTime,
        "market_off_day": marketOffDay,
        "game_name_letter": gameNameLetter,
        "msg": msg,
        "msg_status": msgStatus,
        "open_result": openResult,
        "close_result": closeResult,
        "web_chart_url": webChartUrl,
    };
}
