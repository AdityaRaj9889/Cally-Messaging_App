import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  RxBool showAttachmentMenu = false.obs;

  RxBool showEmoji = false.obs;

  RxString replying = "fkshks".obs;

  TextEditingController emojiController = TextEditingController();
}
