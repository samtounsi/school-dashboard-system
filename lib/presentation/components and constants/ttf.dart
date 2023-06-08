
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'constants.dart';

class DefaultFormField extends StatelessWidget {
  TextEditingController? controller;
  TextInputType? type;
  ValueChanged<String>? onSubmit;
  ValueChanged<String>? onChange;
  VoidCallback? onTap;
  bool? isClickable = true;
  bool? isPassword = false;
  VoidCallback? suffixPressed;
  String? label;
  IconData? prefix;
  FormFieldValidator? validate;
  IconData? suffix;
  TextStyle? textStyle;
  Color? color = Colors.white70;
  Color? borderColor = Colors.grey;
  Color? prefixColor = AppColors.aqua;
  Color? labelTextColor = AppColors.aqua;
  double? width = 250;

  DefaultFormField({
    this.width,
    required this.controller,
    required this.type,
    required this.validate,
    this.label,
    this.color,
    this.isPassword,
    this.isClickable,
    this.onSubmit,
    this.onTap,
    this.onChange,
    this.borderColor,
    this.labelTextColor,
    this.prefix,
    this.prefixColor,
    this.suffix,
    this.suffixPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        onChanged: onChange,
        onTap: onTap,
        onFieldSubmitted: onSubmit,
        enabled: isClickable,
        obscureText: isPassword!,
        validator: validate,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: color,
          prefixIcon: Icon(
            prefix,
            color: prefixColor,
          ),
          suffixIcon: suffix != null
              ? IconButton(
            icon: Icon(suffix),
            onPressed: suffixPressed,
          )
              : null,
        ),
      ),
    );
  }
}
