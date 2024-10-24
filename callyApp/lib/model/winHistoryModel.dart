// To parse this JSON data, do
//
//     final winHistoryModel = winHistoryModelFromJson(jsonString);

import 'dart:convert';

WinHistoryModel winHistoryModelFromJson(String str) => WinHistoryModel.fromJson(json.decode(str));

String winHistoryModelToJson(WinHistoryModel data) => json.encode(data.toJson());

class WinHistoryModel {
    WinHistoryModel({
        required this.winData,
        required this.msg,
        required this.status,
    });

    List<WinHistory> winData;
    String msg;
    bool status;

    factory WinHistoryModel.fromJson(Map<String, dynamic> json) => WinHistoryModel(
        winData: List<WinHistory>.from(json["win_data"].map((x) => WinHistory.fromJson(x))),
        msg: json["msg"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "win_data": List<dynamic>.from(winData.map((x) => x.toJson())),
        "msg": msg,
        "status": status,
    };
}

class WinHistory {
    WinHistory({
        required this.amount,
        required this.transactionType,
        required this.transactionNote,
        required this.amountStatus,
        required this.txRequestNumber,
        required this.winingDate,
        required this.gameName,
        required this.pana,
        required this.session,
        required this.digits,
        required this.closedigits,
    });

    String amount;
    String transactionType;
    String transactionNote;
    String amountStatus;
    String txRequestNumber;
    String winingDate;
    String gameName;
    String pana;
    String session;
    String digits;
    String closedigits;

    factory WinHistory.fromJson(Map<String, dynamic> json) => WinHistory(
        amount: json["amount"],
        transactionType: json["transaction_type"],
        transactionNote: json["transaction_note"],
        amountStatus: json["amount_status"],
        txRequestNumber: json["tx_request_number"],
        winingDate: json["wining_date"],
        gameName: json["game_name"],
        pana: json["pana"],
        session: json["session"],
        digits: json["digits"],
        closedigits: json["closedigits"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "transaction_type": transactionType,
        "transaction_note": transactionNote,
        "amount_status": amountStatus,
        "tx_request_number": txRequestNumber,
        "wining_date": winingDate,
        "game_name": gameName,
        "pana": pana,
        "session": session,
        "digits": digits,
        "closedigits": closedigits,
    };
}