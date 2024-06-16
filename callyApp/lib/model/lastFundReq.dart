// To parse this JSON data, do
//
//     final lastFundRqst = lastFundRqstFromJson(jsonString);

import 'dart:convert';

LastFundRqst lastFundRqstFromJson(String str) =>
    LastFundRqst.fromJson(json.decode(str));

String lastFundRqstToJson(LastFundRqst data) => json.encode(data.toJson());

class LastFundRqst {
  List<dynamic> lastReqDetail;
  String minAmt;
  String maxAmt;
  String qrcode;
  bool status;

  LastFundRqst({
    required this.lastReqDetail,
    required this.minAmt,
    required this.maxAmt,
    required this.qrcode,
    required this.status,
  });

  factory LastFundRqst.fromJson(Map<String, dynamic> json) => LastFundRqst(
        lastReqDetail: json["last_req_detail"] == null
            ? []
            : List<dynamic>.from(json["last_req_detail"].map((x) => x)),
        minAmt: json["min_amt"] ?? '',
        maxAmt: json["max_amt"] ?? '',
        qrcode: json["qrcode"] ?? '',
        status: json["status"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "last_req_detail": List<dynamic>.from(lastReqDetail.map((x) => x)),
        "min_amt": minAmt,
        "max_amt": maxAmt,
        "qrcode": qrcode,
        "status": status,
      };
}
