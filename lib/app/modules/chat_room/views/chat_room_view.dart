import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  const ChatRoomView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        leadingWidth: 100,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          borderRadius: BorderRadius.circular(100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 5),
              Icon(Icons.arrow_back),
              SizedBox(width: 5),
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
                child: Image.asset("assets/logo/noimage.png"),
              ),
            ],
          ),
        ),
        title: WillPopScope(
          onWillPop: () {
            if (controller.isShowEmoji.isTrue) {
              controller.isShowEmoji.value = false;
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lorem Ipsum',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                'Online',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  ItemChat(isSender: true),
                  ItemChat(isSender: false),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                bottom: controller.isShowEmoji.isTrue
                    ? 5
                    : context.mediaQueryPadding.bottom),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: TextField(
                      controller: controller.chatC,
                      focusNode: controller.focusNode,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {
                            controller.focusNode.unfocus();
                            controller.isShowEmoji.toggle();
                          },
                          icon: Icon(Icons.emoji_emotions_outlined),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Material(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.red[900],
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => (controller.isShowEmoji.isTrue)
                ? Container(
                    height: 325,
                    child: EmojiPicker(
                      onEmojiSelected: (category, emoji) {
                        controller.addEmojiToChat(emoji);
                      },
                      onBackspacePressed: () {
                        controller.deleteEmoji();
                      },
                      // textEditingController:
                      // textEditingController, //
                      config: Config(
                        height: 256,
                        // bgColor: const Color(0xFFF2F2F2),
                        checkPlatformCompatibility: true,
                        emojiViewConfig: EmojiViewConfig(
                          // Issue: https://github.com/flutter/flutter/issues/28894
                          emojiSizeMax: 28 *
                              (foundation.defaultTargetPlatform ==
                                      TargetPlatform.iOS
                                  ? 1.20
                                  : 1.0),
                        ),
                        swapCategoryAndBottomBar: false,
                        skinToneConfig: const SkinToneConfig(),
                        categoryViewConfig: const CategoryViewConfig(),
                        bottomActionBarConfig: const BottomActionBarConfig(),
                        searchViewConfig: const SearchViewConfig(),
                      ),
                    ),
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  const ItemChat({
    super.key,
    required this.isSender,
  });

  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.red[900],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: isSender ? Radius.circular(15) : Radius.circular(0),
                bottomRight:
                    isSender ? Radius.circular(0) : Radius.circular(15),
              ),
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              "SDFSFNDSIUNFISBF",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Text(
            "17:20 PM",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    );
  }
}
