import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:song_social/resources/custom_style.dart';
import 'package:song_social/resources/dimensions.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    required this.controller,
    this.obscureText,
    this.validator,
    this.hint,
    this.suffixIcon,
    this.prefixIcon,
    this.label,
    super.key,
    this.readOnly,
    this.onTap,
    this.textInputAction,
    this.padding,
    this.onChanged,
    this.keyboardType,
  });

  final String? label;
  final bool? readOnly;
  final String? hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final EdgeInsetsGeometry? padding;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final void Function()? onTap;

  final TextInputAction? textInputAction;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText ?? false,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onChanged: widget.onChanged,
      validator: widget.validator,
      decoration: InputDecoration(
        errorStyle: CustomStyle.body4Text(
          color: Theme.of(context).colorScheme.error,
          height: 1.5.h,
        ),
        suffixIconColor: Theme.of(context).colorScheme.tertiary,
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.grey[600]),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onTertiaryContainer,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding.w, vertical: Dimensions.defaultSPadding.h),
      ),
      style: TextStyle(
        fontSize: 16.sp,
        color: Color(0xFF333333),
      ),
      keyboardType: widget.keyboardType,
    );
  }
}
