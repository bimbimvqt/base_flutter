import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:song_social/resources/app_assets.dart';

class ChatLoading extends StatelessWidget {
  const ChatLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Theme.of(context).textTheme.bodySmall!.color,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 50.w,
            height: 50.h,
            child: Lottie.asset(
              AppAssets.rawTexting,
              width: 25.w,
              height: 25.h,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            'AI is typing...',
            style: TextStyle(
              color: Theme.of(context).textTheme.labelMedium!.color,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
