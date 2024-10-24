// To parse this JSON data, do
//
//     final gameRatesModel = gameRatesModelFromJson(jsonString);

import 'dart:convert';

GameRatesModel gameRatesModelFromJson(String str) => GameRatesModel.fromJson(json.decode(str));

String gameRatesModelToJson(GameRatesModel data) => json.encode(data.toJson());

class GameRatesModel {
    GameRatesModel({
        required this.gameRates,
        required this.msg,
        required this.status,
    });

    List<GameRate> gameRates;
    String msg;
    bool status;

    factory GameRatesModel.fromJson(Map<String, dynamic> json) => GameRatesModel(
        gameRates: List<GameRate>.from(json["game_rates"].map((x) => GameRate.fromJson(x))),
        msg: json["msg"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "game_rates": List<dynamic>.from(gameRates.map((x) => x.toJson())),
        "msg": msg,
        "status": status,
    };
}

class GameRate {
    GameRate({
        required this.gameRateId,
        required this.singleDigitVal1,
        required this.singleDigitVal2,
        required this.jodiDigitVal1,
        required this.jodiDigitVal2,
        required this.singlePanaVal1,
        required this.singlePanaVal2,
        required this.doublePanaVal1,
        required this.doublePanaVal2,
        required this.tripplePanaVal1,
        required this.tripplePanaVal2,
        required this.halfSangamVal1,
        required this.halfSangamVal2,
        required this.fullSangamVal1,
        required this.fullSangamVal2,
        required this.insertDate,
    });

    String gameRateId;
    String singleDigitVal1;
    String singleDigitVal2;
    String jodiDigitVal1;
    String jodiDigitVal2;
    String singlePanaVal1;
    String singlePanaVal2;
    String doublePanaVal1;
    String doublePanaVal2;
    String tripplePanaVal1;
    String tripplePanaVal2;
    String halfSangamVal1;
    String halfSangamVal2;
    String fullSangamVal1;
    String fullSangamVal2;
    DateTime insertDate;

    factory GameRate.fromJson(Map<String, dynamic> json) => GameRate(
        gameRateId: json["game_rate_id"] ?? "",
        singleDigitVal1: json["single_digit_val_1"] ?? "",
        singleDigitVal2: json["single_digit_val_2"] ?? "",
        jodiDigitVal1: json["jodi_digit_val_1"] ?? "",
        jodiDigitVal2: json["jodi_digit_val_2"] ?? "",
        singlePanaVal1: json["single_pana_val_1"] ?? "",
        singlePanaVal2: json["single_pana_val_2"] ?? "",
        doublePanaVal1: json["double_pana_val_1"] ?? "",
        doublePanaVal2: json["double_pana_val_2"] ?? "",
        tripplePanaVal1: json["tripple_pana_val_1"] ?? "",
        tripplePanaVal2: json["tripple_pana_val_2"] ?? "",
        halfSangamVal1: json["half_sangam_val_1"] ?? "",
        halfSangamVal2: json["half_sangam_val_2"] ?? "",
        fullSangamVal1: json["full_sangam_val_1"] ?? "",
        fullSangamVal2: json["full_sangam_val_2"] ?? "",
        insertDate: DateTime.parse(json["insert_date"]),
    );

    Map<String, dynamic> toJson() => {
        "game_rate_id": gameRateId,
        "single_digit_val_1": singleDigitVal1,
        "single_digit_val_2": singleDigitVal2,
        "jodi_digit_val_1": jodiDigitVal1,
        "jodi_digit_val_2": jodiDigitVal2,
        "single_pana_val_1": singlePanaVal1,
        "single_pana_val_2": singlePanaVal2,
        "double_pana_val_1": doublePanaVal1,
        "double_pana_val_2": doublePanaVal2,
        "tripple_pana_val_1": tripplePanaVal1,
        "tripple_pana_val_2": tripplePanaVal2,
        "half_sangam_val_1": halfSangamVal1,
        "half_sangam_val_2": halfSangamVal2,
        "full_sangam_val_1": fullSangamVal1,
        "full_sangam_val_2": fullSangamVal2,
        "insert_date": insertDate.toIso8601String(),
    };
}
