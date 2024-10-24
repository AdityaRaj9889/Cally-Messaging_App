// To parse this JSON data, do
//
//     final withdrawTxnHistoryDataModel = withdrawTxnHistoryDataModelFromJson(jsonString);

import 'dart:convert';

WithdrawTxnHistoryDataModel withdrawTxnHistoryDataModelFromJson(String str) => WithdrawTxnHistoryDataModel.fromJson(json.decode(str));

String withdrawTxnHistoryDataModelToJson(WithdrawTxnHistoryDataModel data) => json.encode(data.toJson());

class WithdrawTxnHistoryDataModel {
    WithdrawTxnHistoryDataModel({
        required this.withdrawOpenTime,
        required this.withdrawCloseTime,
        required this.withdrawdata,
        required this.lastRequestStatus,
        required this.msg,
        required this.status,
        required this.walletAmt,
    });

    String withdrawOpenTime;
    String withdrawCloseTime;
    List<WalletWithdrawData> withdrawdata;
    String lastRequestStatus;
    String msg;
    bool status;
    String walletAmt;

    factory WithdrawTxnHistoryDataModel.fromJson(Map<String, dynamic> json) => WithdrawTxnHistoryDataModel(
        withdrawOpenTime: json["withdraw_open_time"],
        withdrawCloseTime: json["withdraw_close_time"],
        withdrawdata: json["withdrawdata"] == null ? [] : List<WalletWithdrawData>.from(json["withdrawdata"].map((x) => WalletWithdrawData.fromJson(x))),
        lastRequestStatus: json["last_request_status"],
        msg: json["msg"],
        status: json["status"],
        walletAmt: json["wallet_amt"],
    );

    Map<String, dynamic> toJson() => {
        "withdraw_open_time": withdrawOpenTime,
        "withdraw_close_time": withdrawCloseTime,
        "withdrawdata": List<dynamic>.from(withdrawdata.map((x) => x.toJson())),
        "last_request_status": lastRequestStatus,
        "msg": msg,
        "status": status,
        "wallet_amt": walletAmt,
    };
}

class WalletWithdrawData {
    WalletWithdrawData({
        required this.withdrawRequestId,
        required this.requestAmount,
        required this.requestNumber,
        required this.requestStatus,
        required this.paymentMethod,
        required this.bankName,
        required this.branchAddress,
        required this.acHolderName,
        required this.acNumber,
        required this.ifscCode,
        required this.paytmNumber,
        required this.googlePayNumber,
        required this.phonePayNumber,
        required this.remark,
        required this.paymentReceipt,
        required this.insertDate,
    });

    String withdrawRequestId;
    String requestAmount;
    String requestNumber;
    String requestStatus;
    String paymentMethod;
    String bankName;
    String branchAddress;
    String acHolderName;
    String acNumber;
    String ifscCode;
    String paytmNumber;
    String googlePayNumber;
    String phonePayNumber;
    String remark;
    String paymentReceipt;
    String insertDate;

    factory WalletWithdrawData.fromJson(Map<String, dynamic> json) => WalletWithdrawData(
        withdrawRequestId: json["withdraw_request_id"],
        requestAmount: json["request_amount"],
        requestNumber: json["request_number"],
        requestStatus: json["request_status"],
        paymentMethod: json["payment_method"],
        bankName: json["bank_name"],
        branchAddress: json["branch_address"],
        acHolderName: json["ac_holder_name"],
        acNumber: json["ac_number"],
        ifscCode: json["ifsc_code"],
        paytmNumber: json["paytm_number"],
        googlePayNumber: json["google_pay_number"],
        phonePayNumber: json["phone_pay_number"],
        remark: json["remark"],
        paymentReceipt: json["payment_receipt"],
        insertDate: json["insert_date"],
    );

    Map<String, dynamic> toJson() => {
        "withdraw_request_id": withdrawRequestId,
        "request_amount": requestAmount,
        "request_number": requestNumber,
        "request_status": requestStatus,
        "payment_method": paymentMethod,
        "bank_name": bankName,
        "branch_address": branchAddress,
        "ac_holder_name": acHolderName,
        "ac_number": acNumber,
        "ifsc_code": ifscCode,
        "paytm_number": paytmNumber,
        "google_pay_number": googlePayNumber,
        "phone_pay_number": phonePayNumber,
        "remark": remark,
        "payment_receipt": paymentReceipt,
        "insert_date": insertDate,
    };
}
