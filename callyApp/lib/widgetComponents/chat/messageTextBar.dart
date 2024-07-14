import 'package:callingapp/constant/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MessageTextBar extends GetView {
  final String replyingTo;
  final TextEditingController _textController = TextEditingController();
  final String messageBarHitText;
  final TextStyle messageBarHintStyle;
  final void Function(String)? onTextChanged;
  final void Function()? onTapCloseReply;
  final void Function()? onTapEmoji;
  final void Function()? onTapAttachment;
  final void Function()? onSend;

  MessageTextBar({
    super.key,
    this.replyingTo = "",
    this.messageBarHitText = "Type your message here",
    this.messageBarHintStyle = const TextStyle(fontSize: 16),
    this.onTextChanged,
    this.onTapCloseReply,
    this.onTapEmoji,
    this.onTapAttachment,
    this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            replyingTo.isNotEmpty
                ? Container(
                    color: ColorConst.color1.withOpacity(0.18),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.reply,
                          color: ColorConst.color1,
                          size: 24,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                ' Re : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: ColorConst.color7,
                                ),
                              ),
                              Text(
                                replyingTo,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: ColorConst.color7,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: onTapCloseReply,
                          child: Icon(
                            Icons.close,
                            color: ColorConst.color7,
                            size: 24,
                          ),
                        ),
                      ],
                    ))
                : Container(),
            replyingTo.isNotEmpty
                ? Container(
                    height: 1,
                    color: Colors.grey.shade300,
                  )
                : Container(),
            Container(
              color: ColorConst.color3,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                // horizontal: 10,
              ),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: onTapEmoji,
                    child: Container(
                      height: 43,
                      width: 43,
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      color: ColorConst.color3,
                      child: SvgPicture.asset(
                        AssetsSVG.emoji,
                        color: ColorConst.color1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        controller: _textController,
                        keyboardType: TextInputType.multiline,
                        textCapitalization: TextCapitalization.sentences,
                        minLines: 1,
                        maxLines: 3,
                        onChanged: onTextChanged,
                        decoration: InputDecoration(
                          hintText: messageBarHitText,
                          hintMaxLines: 1,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 10),
                          hintStyle: messageBarHintStyle,
                          fillColor: ColorConst.color3,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: ColorConst.color6,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: ColorConst.color6,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onTapAttachment,
                    child: Container(
                      height: 43,
                      width: 43,
                      padding: const EdgeInsets.all(8.0),
                      color: ColorConst.color3,
                      child: SvgPicture.asset(
                        AssetsSVG.attachment,
                        color: ColorConst.color1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 9),
                    child: GestureDetector(
                      onTap: () {
                        if (_textController.text.trim() != '') {
                          _textController.text = '';
                        }
                      },
                      child: Container(
                        height: 43,
                        width: 43,
                        padding: const EdgeInsets.all(9.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorConst.color1,
                          boxShadow: [
                            BoxShadow(
                              color: ColorConst.color4,
                              blurRadius: 10,
                              spreadRadius: 0.5,
                            )
                          ],
                        ),
                        child: SvgPicture.asset(
                          AssetsSVG.send,
                          color: ColorConst.color3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
