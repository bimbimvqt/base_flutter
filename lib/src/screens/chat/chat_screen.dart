import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:song_social/resources/app_assets.dart';
import 'package:song_social/widgets/chat_bubble.dart';
import 'package:song_social/widgets/image_preview.dart';

import 'chat_controller.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.scrim,
        title: SvgPicture.asset(
          AppAssets.icGeminiTitle,
          width: 120.w,
          height: 30.h,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back(closeOverlays: true);
            controller.messageController.clear();
            controller.removeSelectedImage();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.onTertiary,
            size: 20.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.responseText.clear();
              controller.removeSelectedImage();
            },
            icon: Icon(
              Icons.edit_square,
              color: Theme.of(context).colorScheme.onTertiary,
              size: 26.sp,
            ),
          ),
        ],
      ),
      body: Obx(
        () => SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: controller.responseText.isEmpty
                    ? Center(
                        child: Text(
                          'Ask Gemini something...',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                      )
                    : _buildListMessage(),
              ),
              if (controller.imagePath.isNotEmpty)
                ImagePreview(
                  imagePath: controller.imagePath.value,
                  onRemove: controller.removeSelectedImage,
                ),
              _buildTextField(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListMessage() {
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: ListView.builder(
            reverse: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            shrinkWrap: false,
            padding: EdgeInsets.only(bottom: 20.h),
            controller: controller.scrollController,
            itemCount: controller.responseText.length + (controller.isLoading.value ? 1 : 0),
            itemBuilder: (context, index) {
              final reversedIndex = controller.responseText.length - 1 - index;
              final message = controller.responseText[reversedIndex];
              return ChatBubble(
                message: message,
              );
            },
          ),
        ));
  }

  Widget _buildTextField(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              controller: controller.messageController,
              onChanged: (text) {
                controller.messageText.value = text;
              },
              style: TextStyle(color: Theme.of(context).textTheme.labelLarge!.color),
              decoration: InputDecoration(
                suffixIcon: Obx(() => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.pickImage();
                          },
                          icon: Icon(
                            Icons.image,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: controller.messageText.isEmpty ? null : controller.sendRequest,
                          icon: Icon(
                            Icons.send,
                            color: controller.messageText.isEmpty ? Colors.grey : Colors.black,
                          ),
                        ),
                      ],
                    )),
                hintText: 'Chat to Gemini...',
                hintStyle: TextStyle(color: Theme.of(context).textTheme.displayLarge!.color),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.onTertiaryContainer,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
