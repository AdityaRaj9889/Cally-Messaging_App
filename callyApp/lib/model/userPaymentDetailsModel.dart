// To parse this JSON data, do
//
//     final getUserPaymentDetailsModel = getUserPaymentDetailsModelFromJson(jsonString);

import 'dart:convert';

GetUserPaymentDetailsModel getUserPaymentDetailsModelFromJson(String str) => GetUserPaymentDetailsModel.fromJson(json.decode(str));

String getUserPaymentDetailsModelToJson(GetUserPaymentDetailsModel data) => json.encode(data.toJson());

class GetUserPaymentDetailsModel {
    GetUserPaymentDetailsModel({
        required this.paymentDetails,
        required this.msg,
        required this.status,
    });

    List<PaymentDetail> paymentDetails;
    String msg;
    bool status;

    factory GetUserPaymentDetailsModel.fromJson(Map<String, dynamic> json) => GetUserPaymentDetailsModel(
        paymentDetails: List<PaymentDetail>.from(json["payment_details"].map((x) => PaymentDetail.fromJson(x))),
        msg: json["msg"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "payment_details": List<dynamic>.from(paymentDetails.map((x) => x.toJson())),
        "msg": msg,
        "status": status,
    };
}

class PaymentDetail {
    PaymentDetail({
        required this.bankDetailId,
        required this.userId,
        required this.bankName,
        required this.branchAddress,
        required this.acHolderName,
        required this.acNumber,
        required this.ifscCode,
        required this.paytmNumber,
        required this.googlePayNumber,
        required this.phonePayNumber,
        required this.insertDate,
    });

    String bankDetailId;
    String userId;
    String bankName;
    String branchAddress;
    String acHolderName;
    String acNumber;
    String ifscCode;
    String paytmNumber;
    String googlePayNumber;
    String phonePayNumber;
    DateTime insertDate;

    factory PaymentDetail.fromJson(Map<String, dynamic> json) => PaymentDetail(
        bankDetailId: json["bank_detail_id"],
        userId: json["user_id"],
        bankName: json["bank_name"],
        branchAddress: json["branch_address"],
        acHolderName: json["ac_holder_name"],
        acNumber: json["ac_number"],
        ifscCode: json["ifsc_code"],
        paytmNumber: json["paytm_number"],
        googlePayNumber: json["google_pay_number"],
        phonePayNumber: json["phone_pay_number"],
        insertDate: DateTime.parse(json["insert_date"]),
    );

    Map<String, dynamic> toJson() => {
        "bank_detail_id": bankDetailId,
        "user_id": userId,
        "bank_name": bankName,
        "branch_address": branchAddress,
        "ac_holder_name": acHolderName,
        "ac_number": acNumber,
        "ifsc_code": ifscCode,
        "paytm_number": paytmNumber,
        "google_pay_number": googlePayNumber,
        "phone_pay_number": phonePayNumber,
        "insert_date": insertDate.toIso8601String(),
    };
}
