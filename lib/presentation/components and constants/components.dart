// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';

Future<DateTime?> datePicker({
  required BuildContext context,
  Color color = AppColors.aqua,
}) {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1990),
    lastDate: DateTime(2050),
    builder: (context, child) => Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.light(
          primary: color,
        ),
      ),
      child: child!,
    ),
  );
}

Widget defaultformfeild({
  double Width = 250,
  double circular = 50,
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  VoidCallback? onTap,
  bool isClickable = true,
  bool ispassword = false,
  VoidCallback? suffixpressed,
  String? label,
  IconData? prefix,
  required FormFieldValidator validate,
  IconData? suffix,
  TextStyle? textStyle,
  Color color = Colors.white70,
  Color bordercolor = Colors.grey,
  Color prefixColor = AppColors.darkAqua,
  Color labelTextColor = AppColors.darkAqua,
  Color suffixColor = AppColors.aqua,
  //Color focusColor=Colors.grey,
  double verticalPadding = 15,
  double horizontalPadding = 15,
}) =>
    Container(
      width: Width,
      child: TextFormField(
        textDirection: TextDirection.ltr,
        style: textStyle,
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        enabled: isClickable,
        obscureText: ispassword,
        validator: validate,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: verticalPadding, horizontal: horizontalPadding),
          filled: true,
          fillColor: color,
          labelText: label,
          labelStyle: TextStyle(color: labelTextColor, fontSize: 22),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(circular),
              borderSide: BorderSide(color: bordercolor)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(circular),
            borderSide: BorderSide(color: bordercolor),
          ),
          prefixIcon: Icon(
            prefix,
            color: prefixColor,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  icon: Icon(
                    suffix,
                    color: suffixColor,
                  ),
                  onPressed: suffixpressed,
                )
              : null,
        ),
      ),
    );

Widget defaultTextButton({
  required String text,
  required function,
  required radius,
  double width = 250,
  double height = 50,
  Color background = AppColors.aqua,
  bool isUpperCase = true,
  double textSize = 16,
  Color textColor = Colors.white,
  FontWeight? fontWeight,
  Color borderColor = Colors.transparent,
  borderWidth=3
}) =>
    Container(
      height: height,
      width: width,
      child: TextButton(
        onPressed: function,
        style: TextButton.styleFrom(
          backgroundColor: background,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
              color: textColor, fontSize: textSize, fontWeight: fontWeight),
        ),
      ),
    );

navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);
Widget myDevider() {
  return Padding(
    padding: const EdgeInsetsDirectional.only(start: 20),
    child: Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    ),
  );
}

Widget text(
  String data, {
  double size = 16,
  Color color = Colors.black,
  FontWeight? weight,
}) {
  return Text(
    data,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weight,
    ),
  );
}
