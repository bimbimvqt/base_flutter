import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:song_social/models/message.dart';
import 'package:song_social/resources/app_assets.dart';
import 'package:song_social/widgets/chat_loading.dart';
import 'package:song_social/widgets/message_image.dart';
import 'package:song_social/src/screens/chat/chat_controller.dart';

class ChatBubble extends StatelessWidget {
  final Message message;

  const ChatBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();
    return Row(
      mainAxisAlignment: message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!message.isUser)
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.onTertiaryContainer,
            child: SvgPicture.asset(
              AppAssets.icGemini,
              width: 22.sp,
              height: 22.sp,
            ),
          ),
        Flexible(
          child: controller.isLoading.value && !message.isUser
              ? ChatLoading()
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: message.isUser
                        ? Theme.of(context).textTheme.displayMedium!.color
                        : Theme.of(context).textTheme.bodySmall!.color,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (message.imagePath != null)
                        MessageImage(
                          imagePath: message.imagePath!,
                        ),
                      if (message.content.isNotEmpty)
                        Text(
                          message.content,
                          style: TextStyle(
                            color: message.isUser
                                ? Theme.of(context).textTheme.bodyMedium!.color
                                : Theme.of(context).textTheme.labelMedium!.color,
                            fontSize: 16.sp,
                          ),
                        ),
                      SizedBox(height: 4.h),
                      Text(
                        _formatTime(message.timestamp),
                        style: TextStyle(
                          color: message.isUser
                              ? Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.7)
                              : Theme.of(context).textTheme.labelMedium!.color!.withOpacity(0.7),
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ],
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
