import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:song_social/resources/custom_style.dart';

class ButtonOutLineWidget extends StatelessWidget {
  const ButtonOutLineWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.radius,
    this.textColor,
  });

  final String title;
  final Color? color;
  final Color? textColor;
  final double? radius;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        elevation: WidgetStateProperty.all<double>(0),
        fixedSize: WidgetStateProperty.all<Size>(Size(MediaQuery.of(context).size.width, 50.h)),
        backgroundColor: WidgetStateProperty.all<Color>(color ?? Theme.of(context).colorScheme.surface),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 50.r),
          ),
        ),
      ),
      child: Text(
        title,
        style: CustomStyle.buttonText(
            fontWeight: FontWeight.w700, color: textColor ?? Theme.of(context).colorScheme.onTertiary),
      ),
    );
  }
}
