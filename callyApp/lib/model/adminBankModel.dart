// To parse this JSON data, do
//
//     final adminBankDetailsModel = adminBankDetailsModelFromJson(jsonString);

import 'dart:convert';

AdminBankDetailsModel adminBankDetailsModelFromJson(String str) => AdminBankDetailsModel.fromJson(json.decode(str));

String adminBankDetailsModelToJson(AdminBankDetailsModel data) => json.encode(data.toJson());

class AdminBankDetailsModel {
    AdminBankDetailsModel({
        required this.bankDetails,
        required this.msg,
        required this.status,
    });

    List<BankDetail> bankDetails;
    String msg;
    bool status;

    factory AdminBankDetailsModel.fromJson(Map<String, dynamic> json) => AdminBankDetailsModel(
        bankDetails: json["bank_details"] == null ? [] : List<BankDetail>.from(json["bank_details"].map((x) => BankDetail.fromJson(x))),
        msg: json["msg"] ?? '',
        status: json["status"] ?? false,
    );

    Map<String, dynamic> toJson() => {
        "bank_details": List<dynamic>.from(bankDetails.map((x) => x.toJson())),
        "msg": msg,
        "status": status,
    };
}

class BankDetail {
    BankDetail({
        required this.acHolderName,
        required this.accountNumber,
        required this.ifscCode,
        required this.upiPaymentId,
    });

    String acHolderName;
    String accountNumber;
    String ifscCode;
    String upiPaymentId;

    factory BankDetail.fromJson(Map<String, dynamic> json) => BankDetail(
        acHolderName: json["ac_holder_name"] ?? '',
        accountNumber: json["account_number"] ?? '',
        ifscCode: json["ifsc_code"] ?? '',
        upiPaymentId: json["upi_payment_id"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "ac_holder_name": acHolderName,
        "account_number": accountNumber,
        "ifsc_code": ifscCode,
        "upi_payment_id": upiPaymentId,
    };
}
