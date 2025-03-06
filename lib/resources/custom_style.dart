import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startup_app/resources/custom_color.dart';
import 'package:startup_app/resources/dimensions.dart';

class CustomStyle {
  static TextStyle buttonText(
          {Color? color,
          double? fontSize,
          FontWeight? fontWeight,
          double? height,
          TextDecoration? textDecoration,
          double? letterSpacing}) =>
      GoogleFonts.poppins(
          color: color ?? CustomColor.primaryColor,
          fontSize: fontSize ?? Dimensions.buttonFontSize.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
          letterSpacing: letterSpacing ?? -0.02,
          decoration: textDecoration,
          height: height ?? 1.1.sp);

  static TextStyle button2Text(
          {Color? color,
          double? fontSize,
          FontWeight? fontWeight,
          double? height,
          TextDecoration? textDecoration,
          double? letterSpacing}) =>
      GoogleFonts.poppins(
          color: color ?? CustomColor.primaryColor,
          fontSize: fontSize ?? Dimensions.button2FontSize.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
          letterSpacing: letterSpacing ?? -0.02,
          decoration: textDecoration,
          height: height ?? 1.1.sp);

  static TextStyle heading1Text(
          {Color? color, double? fontSize, FontWeight? fontWeight, double? height, double? letterSpacing}) =>
      GoogleFonts.poppins(
        color: color ?? CustomColor.primaryColor,
        fontSize: fontSize ?? Dimensions.heading1FontSize.sp,
        fontWeight: fontWeight ?? FontWeight.w600,
        letterSpacing: letterSpacing ?? 0.01,
        height: height,
      );

  static TextStyle heading2Text(
          {Color? color, double? fontSize, FontWeight? fontWeight, double? height, double? letterSpacing}) =>
      GoogleFonts.poppins(
        color: color ?? CustomColor.primaryColor,
        height: height ?? 1.sp,
        fontSize: fontSize ?? Dimensions.heading2FontSize.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        letterSpacing: letterSpacing ?? -1.sp,
      );

  static TextStyle heading3Text(
          {Color? color, double? fontSize, FontWeight? fontWeight, double? height, double? letterSpacing}) =>
      GoogleFonts.poppins(
        color: color ?? CustomColor.primaryColor,
        fontSize: fontSize ?? Dimensions.heading3FontSize.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        letterSpacing: letterSpacing ?? -0.5,
        height: height,
      );

  static TextStyle appBarTitleText(
          {Color? color, double? fontSize, FontWeight? fontWeight, double? height, double? letterSpacing}) =>
      GoogleFonts.quicksand(
          color: color ?? CustomColor.primaryColor,
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight ?? FontWeight.w700,
          height: height,
          letterSpacing: letterSpacing);

  static TextStyle subHeading1Text(
          {Color? color,
          double? fontSize,
          FontStyle? fontStyle,
          FontWeight? fontWeight,
          double? height,
          TextDecoration? decoration,
          double? letterSpacing}) =>
      GoogleFonts.poppins(
          color: color ?? CustomColor.primaryColor,
          height: height ?? 1.sp,
          fontSize: fontSize ?? Dimensions.subHeading1FontSize.sp,
          fontStyle: fontStyle,
          fontWeight: fontWeight ?? FontWeight.w500,
          decoration: decoration,
          letterSpacing: letterSpacing);

  static TextStyle subHeading2Text(
          {Color? color, double? fontSize, FontWeight? fontWeight, double? height, double? letterSpacing}) =>
      GoogleFonts.poppins(
          color: color ?? CustomColor.primaryColor,
          fontSize: fontSize ?? Dimensions.subHeading2FontSize.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
          height: height,
          letterSpacing: letterSpacing);

  static TextStyle body1Text(
          {Color? color,
          double? fontSize,
          FontWeight? fontWeight,
          double? height,
          FontStyle? fontStyle,
          TextDecoration? decoration,
          double? letterSpacing}) =>
      GoogleFonts.poppins(
          color: color ?? CustomColor.primaryColor,
          height: height ?? 1.sp,
          fontSize: fontSize ?? Dimensions.body1FontSize.sp,
          fontStyle: fontStyle,
          fontWeight: fontWeight ?? FontWeight.w500,
          decoration: decoration,
          letterSpacing: letterSpacing);

  static TextStyle body2Text(
          {Color? color,
          double? fontSize,
          FontWeight? fontWeight,
          FontStyle? fontStyle,
          double? height,
          double? letterSpacing}) =>
      GoogleFonts.poppins(
          color: color ?? CustomColor.primaryColor,
          height: height ?? 1.sp,
          fontSize: fontSize ?? Dimensions.body2FontSize.sp,
          fontStyle: fontStyle,
          fontWeight: fontWeight ?? FontWeight.w500,
          letterSpacing: letterSpacing);

  static TextStyle body3Text(
          {Color? color,
          double? fontSize,
          FontWeight? fontWeight,
          FontStyle? fontStyle,
          double? height,
          double? letterSpacing}) =>
      GoogleFonts.poppins(
          color: color ?? CustomColor.primaryColor,
          height: height ?? 1.sp,
          fontSize: fontSize ?? Dimensions.body3FontSize.sp,
          fontStyle: fontStyle,
          fontWeight: fontWeight ?? FontWeight.w500,
          letterSpacing: letterSpacing);

  static TextStyle body4Text(
          {Color? color,
          double? fontSize,
          FontWeight? fontWeight,
          FontStyle? fontStyle,
          double? height,
          double? letterSpacing}) =>
      GoogleFonts.poppins(
          color: color ?? CustomColor.primaryColor,
          height: height ?? 1.sp,
          fontSize: fontSize ?? Dimensions.body4FontSize.sp,
          fontStyle: fontStyle,
          fontWeight: fontWeight ?? FontWeight.w400,
          letterSpacing: letterSpacing);

  static TextStyle subBody1Text(
          {Color? color,
          double? fontSize,
          FontStyle? fontStyle,
          FontWeight? fontWeight,
          double? height,
          double? letterSpacing}) =>
      GoogleFonts.poppins(
          color: color ?? CustomColor.primaryColor,
          fontSize: fontSize ?? Dimensions.small1FontSize.sp,
          fontStyle: fontStyle,
          fontWeight: fontWeight ?? FontWeight.w500,
          height: height,
          letterSpacing: letterSpacing);

  static TextStyle subBody2Text(
          {Color? color,
          double? fontSize,
          FontWeight? fontWeight,
          double? height,
          TextDecoration? decoration,
          double? letterSpacing,
          FontStyle? fontStyle}) =>
      GoogleFonts.poppins(
          color: color ?? CustomColor.primaryColor,
          height: height ?? 1.1.sp,
          fontSize: fontSize ?? Dimensions.small2FontSize.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
          decoration: decoration,
          fontStyle: fontStyle ?? FontStyle.normal,
          letterSpacing: letterSpacing);

  static TextStyle subBody3Text(
          {Color? color,
          double? fontSize,
          FontWeight? fontWeight,
          double? height,
          FontStyle? fontStyle,
          TextDecoration? decoration,
          double? letterSpacing}) =>
      GoogleFonts.poppins(
          color: color ?? CustomColor.primaryColor,
          height: height ?? 1.1.sp,
          fontSize: fontSize ?? Dimensions.small3FontSize.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle,
          decoration: decoration,
          letterSpacing: letterSpacing);

  static TextStyle subBody4Text(
          {Color? color,
          double? fontSize,
          FontStyle? fontStyle,
          FontWeight? fontWeight,
          double? height,
          TextDecoration? textDecoration,
          double? letterSpacing}) =>
      GoogleFonts.poppins(
          color: color ?? CustomColor.primaryColor,
          height: height ?? 1.1.sp,
          fontSize: fontSize ?? Dimensions.small4FontSize.sp,
          fontStyle: fontStyle,
          fontWeight: fontWeight ?? FontWeight.w400,
          decoration: textDecoration,
          letterSpacing: letterSpacing);

  static TextStyle tabItemText(
          {Color? color,
          double? fontSize,
          FontWeight? fontWeight,
          double? height,
          List<Shadow>? shadows,
          double? letterSpacing}) =>
      GoogleFonts.poppins(
          color: color ?? CustomColor.primaryColor,
          height: height ?? 1.sp,
          fontSize: fontSize ?? 9.sp,
          shadows: shadows,
          fontWeight: fontWeight ?? FontWeight.w600,
          letterSpacing: letterSpacing);

  static TextStyle profileDisplayText(
          {Color? color, double? fontSize, FontWeight? fontWeight, double? height, double? letterSpacing}) =>
      GoogleFonts.pacifico(
          fontSize: fontSize ?? Dimensions.heading2FontSize.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color,
          letterSpacing: letterSpacing,
          height: height);
}
