// To parse this JSON data, do
//
//     final walletTransactionHistoryModel = walletTransactionHistoryModelFromJson(jsonString);

import 'dart:convert';

WalletTransactionHistoryModel walletTransactionHistoryModelFromJson(String str) => WalletTransactionHistoryModel.fromJson(json.decode(str));

String walletTransactionHistoryModelToJson(WalletTransactionHistoryModel data) => json.encode(data.toJson());

class WalletTransactionHistoryModel {
    WalletTransactionHistoryModel({
        required this.walletAmt,
        required this.holdAmt,
        required this.transactionHistory,
        required this.inHistory,
        required this.outHistory,
        required this.msg,
        required this.status,
    });

    String walletAmt;
    String holdAmt;
    List<WalletHistory> transactionHistory;
    List<WalletHistory> inHistory;
    List<WalletHistory> outHistory;
    String msg;
    bool status;

    factory WalletTransactionHistoryModel.fromJson(Map<String, dynamic> json) => WalletTransactionHistoryModel(
        walletAmt: json["wallet_amt"],
        holdAmt: json["hold_amt"],
        transactionHistory: List<WalletHistory>.from(json["transaction_history"].map((x) => WalletHistory.fromJson(x))),
        inHistory: List<WalletHistory>.from(json["in_history"].map((x) => WalletHistory.fromJson(x))),
        outHistory: List<WalletHistory>.from(json["out_history"].map((x) => WalletHistory.fromJson(x))),
        msg: json["msg"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "wallet_amt": walletAmt,
        "hold_amt": holdAmt,
        "transaction_history": List<dynamic>.from(transactionHistory.map((x) => x.toJson())),
        "in_history": List<dynamic>.from(inHistory.map((x) => x.toJson())),
        "out_history": List<dynamic>.from(outHistory.map((x) => x.toJson())),
        "msg": msg,
        "status": status,
    };
}

class WalletHistory {
    WalletHistory({
        required this.transactionId,
        required this.amount,
        required this.transactionType,
        required this.transactionNote,
        required this.transferNote,
        required this.amountStatus,
        required this.insertDate,
        required this.txRequestNumber,
    });

    String transactionId;
    String amount;
    String transactionType;
    String transactionNote;
    String transferNote;
    String amountStatus;
    String insertDate;
    String txRequestNumber;

    factory WalletHistory.fromJson(Map<String, dynamic> json) => WalletHistory(
        transactionId: json["transaction_id"],
        amount: json["amount"],
        transactionType: json["transaction_type"],
        transactionNote: json["transaction_note"],
        transferNote: json["transfer_note"],
        amountStatus: json["amount_status"],
        insertDate: json["insert_date"],
        txRequestNumber: json["tx_request_number"],
    );

    Map<String, dynamic> toJson() => {
        "transaction_id": transactionId,
        "amount": amount,
        "transaction_type": transactionType,
        "transaction_note": transactionNote,
        "transfer_note": transferNote,
        "amount_status": amountStatus,
        "insert_date": insertDate,
        "tx_request_number": txRequestNumber,
    };
}
