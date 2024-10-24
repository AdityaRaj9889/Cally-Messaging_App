// To parse this JSON data, do
//
//     final bidHistoryModel = bidHistoryModelFromJson(jsonString);

import 'dart:convert';

BidHistoryModel bidHistoryModelFromJson(String str) => BidHistoryModel.fromJson(json.decode(str));

String bidHistoryModelToJson(BidHistoryModel data) => json.encode(data.toJson());

class BidHistoryModel {
    BidHistoryModel({
        required this.bidData,
        required this.msg,
        required this.status,
    });

    List<BidHistory> bidData;
    String msg;
    bool status;

    factory BidHistoryModel.fromJson(Map<String, dynamic> json) => BidHistoryModel(
        bidData: List<BidHistory>.from(json["bid_data"].map((x) => BidHistory.fromJson(x))),
        msg: json["msg"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "bid_data": List<dynamic>.from(bidData.map((x) => x.toJson())),
        "msg": msg,
        "status": status,
    };
}

class BidHistory {
    BidHistory({
        required this.gameName,
        required this.pana,
        required this.session,
        required this.digits,
        required this.closedigits,
        required this.points,
        required this.bidTxId,
        required this.bidDate,
    });

    String gameName;
    String pana;
    String session;
    String digits;
    String closedigits;
    String points;
    String bidTxId;
    String bidDate;

    factory BidHistory.fromJson(Map<String, dynamic> json) => BidHistory(
        gameName: json["game_name"] ?? '',
        pana: json["pana"] ?? '',
        session: json["session"] ?? '',
        digits: json["digits"] ?? '',
        closedigits: json["closedigits"] ?? '',
        points: json["points"] ?? '',
        bidTxId: json["bid_tx_id"] ?? '',
        bidDate: json["bid_date"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "game_name": gameName,
        "pana": pana,
        "session": session,
        "digits": digits,
        "closedigits": closedigits,
        "points": points,
        "bid_tx_id": bidTxId,
        "bid_date": bidDate,
    };
}
