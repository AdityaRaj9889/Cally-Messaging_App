// To parse this JSON data, do
//
//     final howToPlayModel = howToPlayModelFromJson(jsonString);

import 'dart:convert';

HowToPlayModel howToPlayModelFromJson(String str) => HowToPlayModel.fromJson(json.decode(str));

String howToPlayModelToJson(HowToPlayModel data) => json.encode(data.toJson());

class HowToPlayModel {
    HowToPlayModel({
        required this.content,
        required this.msg,
        required this.status,
    });

    List<Content> content;
    String msg;
    bool status;

    factory HowToPlayModel.fromJson(Map<String, dynamic> json) => HowToPlayModel(
        content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        msg: json["msg"] ?? "",
        status: json["status"] ?? false,
    );

    Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "msg": msg,
        "status": status,
    };
}

class Content {
    Content({
        required this.howToPlayContent,
        required this.videoLink,
    });

    String howToPlayContent;
    String videoLink;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        howToPlayContent: json["how_to_play_content"],
        videoLink: json["video_link"],
    );

    Map<String, dynamic> toJson() => {
        "how_to_play_content": howToPlayContent,
        "video_link": videoLink,
    };
}
