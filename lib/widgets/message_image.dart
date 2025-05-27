import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import 'package:song_social/widgets/full_screen_image.dart';

class MessageImage extends StatelessWidget {
  final String imagePath;

  const MessageImage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullScreenImage(imagePath: imagePath),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.file(
            File(imagePath),
            width: 200.w,
            height: 200.w,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
