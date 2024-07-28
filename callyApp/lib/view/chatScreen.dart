import 'dart:async';

import 'package:callingapp/constant/assets.dart';
import 'package:callingapp/controller/chatController.dart';
import 'package:callingapp/widgetComponents/appbar.dart';
import 'package:callingapp/widgetComponents/chat/chatBubble.dart';
import 'package:callingapp/widgetComponents/chat/dateBubble.dart';
import 'package:callingapp/widgetComponents/chat/messageTextBar.dart';
import 'package:callingapp/widgetComponents/chat/moreOptionItems.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' as foundation;

class ChatScreen extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.showEmoji.toggle(),
        child: Scaffold(
          backgroundColor: ColorConst.color3,
          appBar: AppbarWidget(
            title: "Allen".obs,
            profile: AssetsImage.appLogo,
            firstIcon: AssetsSVG.phone.obs,
            fIconClick: () {},
            secondIcon: AssetsSVG.video.obs,
            sIconClick: () {},
            lastIcon: AssetsSVG.more.obs,
            lIconClick: () {},
          ),
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) => index == 3 || index == 7
                          ? Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: DateBubble(
                                  date: DateTime(2021, 5, 7),
                                  color: ColorConst.color10,
                                ),
                              ),
                            )
                          : ChatBubble(
                              isSender: index == 1 ||
                                      index == 4 ||
                                      index == 6 ||
                                      index == 12 ||
                                      index == 14 ||
                                      index == 18
                                  ? true
                                  : false,
                              seen: index == 1 ||
                                      index == 4 ||
                                      index == 6 ||
                                      index == 12 ||
                                      index == 14 ||
                                      index == 18
                                  ? true
                                  : false,
                              msg: 'Hi, How are you? f fg vgh g g hf gf  g',
                              msgTime: "23:59",
                              tail: true,
                              color: index == 1 ||
                                      index == 4 ||
                                      index == 6 ||
                                      index == 12 ||
                                      index == 14 ||
                                      index == 18
                                  ? ColorConst.color10
                                  : ColorConst.color11,
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: index == 1 ||
                                        index == 4 ||
                                        index == 6 ||
                                        index == 12 ||
                                        index == 14 ||
                                        index == 18
                                    ? ColorConst.color7
                                    : ColorConst.color7,
                                // fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                    ),
                    //attachment container
                    if (controller.showAttachmentMenu.value)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 250,
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorConst.color3,
                              borderRadius: BorderRadius.circular(25.0),
                              border: Border.all(
                                color: ColorConst.color6,
                                width: 0.5,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    MoreOptionItems(
                                      itemIcon: AssetsSVG.document,
                                      itemName: "Document",
                                    ),
                                    MoreOptionItems(
                                      itemIcon: AssetsSVG.camera,
                                      itemName: "Camera",
                                    ),
                                    MoreOptionItems(
                                      itemIcon: AssetsSVG.gallery,
                                      itemName: "Gallery",
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    MoreOptionItems(
                                      itemIcon: AssetsSVG.audio,
                                      itemName: "Audio",
                                    ),
                                    MoreOptionItems(
                                      itemIcon: AssetsSVG.location,
                                      itemName: "Location",
                                    ),
                                    MoreOptionItems(
                                      itemIcon: AssetsSVG.contact,
                                      itemName: "Contact",
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
              MessageTextBar(
                onTextTap: () => controller.showEmoji.value = false,
                textController: controller.emojiController,
                replyingTo: controller.replying.value,
                onTapCloseReply: () => controller.replying.value = "",
                onTapAttachment: () => controller.showAttachmentMenu.toggle(),
                onTapEmoji: () {
                  FocusScope.of(context).unfocus();
                  Timer(Duration(milliseconds: 300),
                      () => controller.showEmoji.toggle());
                },
              ),
              if (controller.showEmoji.value)
                GetBuilder<ChatController>(
                  builder: (controller) {
                    return Container(
                      height: 270,
                      child: EmojiPicker(
                        onBackspacePressed: () {},
                        onEmojiSelected: (Category? category, Emoji emoji) {},
                        textEditingController: controller.emojiController,
                        config: Config(
                          backspaceColor: ColorConst.color1,
                          iconColorSelected: ColorConst.color1,
                          indicatorColor: ColorConst.color1,
                        ),
                      ),
                    );
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
