// To parse this JSON data, do
//
//     final getCurrentGameDate = getCurrentGameDateFromJson(jsonString);

import 'dart:convert';

GetCurrentGameDate getCurrentGameDateFromJson(String str) => GetCurrentGameDate.fromJson(json.decode(str));

String getCurrentGameDateToJson(GetCurrentGameDate data) => json.encode(data.toJson());

class GetCurrentGameDate {
    GetCurrentGameDate({
        required this.walletAmt,
        required this.minBidAmount,
        required this.maxBidAmount,
        required this.minDeposite,
        required this.maxDeposite,
        required this.minWithdrawal,
        required this.maxWithdrawal,
        required this.minTransfer,
        required this.maxTransfer,
        required this.date,
        required this.newDate,
        required this.status,
    });

    String walletAmt;
    String minBidAmount;
    String maxBidAmount;
    String minDeposite;
    String maxDeposite;
    String minWithdrawal;
    String maxWithdrawal;
    String minTransfer;
    String maxTransfer;
    String date;
    String newDate;
    bool status;

    factory GetCurrentGameDate.fromJson(Map<String, dynamic> json) => GetCurrentGameDate(
        walletAmt: json["wallet_amt"] ?? '',
        minBidAmount: json["min_bid_amount"] ?? '',
        maxBidAmount: json["max_bid_amount"] ?? '',
        minDeposite: json["min_deposite"] ?? '',
        maxDeposite: json["max_deposite"] ?? '',
        minWithdrawal: json["min_withdrawal"] ?? '',
        maxWithdrawal: json["max_withdrawal"] ?? '',
        minTransfer: json["min_transfer"] ?? '',
        maxTransfer: json["max_transfer"] ?? '',
        date: json["date"] ?? '',
        newDate: json["new_date"] ?? '',
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "wallet_amt": walletAmt,
        "min_bid_amount": minBidAmount,
        "max_bid_amount": maxBidAmount,
        "min_deposite": minDeposite,
        "max_deposite": maxDeposite,
        "min_withdrawal": minWithdrawal,
        "max_withdrawal": maxWithdrawal,
        "min_transfer": minTransfer,
        "max_transfer": maxTransfer,
        "date": date,
        "new_date": newDate,
        "status": status,
    };
}
