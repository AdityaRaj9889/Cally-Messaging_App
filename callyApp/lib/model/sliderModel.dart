// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromJson(jsonString);

import 'dart:convert';

SliderModel sliderModelFromJson(String str) => SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
    SliderModel({
        required this.sliderdata,
        required this.msg,
        required this.status,
    });

    List<SliderImg> sliderdata;
    String msg;
    bool status;

    factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        sliderdata: json["sliderdata"] == null ? [] : List<SliderImg>.from(json["sliderdata"].map((x) => SliderImg.fromJson(x))),
        msg: json["msg"] ?? '',
        status: json["status"] ?? false,
    );

    Map<String, dynamic> toJson() => {
        "sliderdata": List<dynamic>.from(sliderdata.map((x) => x.toJson())),
        "msg": msg,
        "status": status,
    };
}

class SliderImg {
    SliderImg({
        required this.imageId,
        required this.sliderImage,
    });

    String imageId;
    String sliderImage;

    factory SliderImg.fromJson(Map<String, dynamic> json) => SliderImg(
        imageId: json["image_id"] ?? '',
        sliderImage: json["slider_image"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "image_id": imageId,
        "slider_image": sliderImage,
    };
}
