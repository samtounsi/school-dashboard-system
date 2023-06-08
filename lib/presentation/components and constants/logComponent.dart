// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';

Widget defaultformfeild({
  double Width =450,
  TextEditingController? controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  VoidCallback? onTap,
  bool isClickable=true,
  bool ispassword=false,
  VoidCallback? suffixpressed,
   String? label,
  IconData? prefix,
  required FormFieldValidator validate,
  IconData? suffix,
  TextStyle? textStyle,
  Color color=Colors.white70,
  Color bordercolor=Colors.grey,
  Color prefixColor=AppColors.aqua,
  Color labelTextColor=AppColors.aqua,
})=>Container(
  width: Width,
  child:   TextFormField(
    readOnly: true,
    textDirection: TextDirection.ltr,
    style: textStyle,
    controller: controller,
    keyboardType: type,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    onTap: onTap,
    enabled: isClickable,
    obscureText: ispassword,
    validator:validate,
    decoration: InputDecoration(
      filled: true,
      fillColor: color,
      labelText: label,
      enabled: true,
      labelStyle: TextStyle(
          color: labelTextColor
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),


      ),
      prefixIcon: Icon(
        prefix,
        color: prefixColor,
      ),
      suffixIcon: suffix != null ? IconButton(icon: Icon(suffix),color: AppColors.aqua,
        onPressed:suffixpressed,) : null,
    ),

  ),
);
Widget defaultWriteFormField({
  double Width =450,
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  VoidCallback? onTap,
  bool isClickable=true,
  bool ispassword=false,
  VoidCallback? suffixpressed,
  String? label,
  IconData? prefix,
  required FormFieldValidator validate,
  IconData? suffix,
  TextStyle? textStyle,
  Color color=Colors.white70,
  Color bordercolor=Colors.grey,
  Color prefixColor=AppColors.aqua,
  Color labelTextColor=AppColors.aqua,
})=>Container(
  width: Width,
  child:   TextFormField(

    textDirection: TextDirection.ltr,
    style: textStyle,
    controller: controller,
    keyboardType: type,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    onTap: onTap,
    enabled: isClickable,
    obscureText: ispassword,
    validator:validate,
    decoration: InputDecoration(
      filled: true,
      fillColor: color,
      labelText: label,
      enabled: true,
      labelStyle: TextStyle(
          color: labelTextColor
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),


      ),
      prefixIcon: Icon(
        prefix,
        color: prefixColor,
      ),
      suffixIcon: suffix != null ? IconButton(icon: Icon(suffix),color: AppColors.aqua,
        onPressed:suffixpressed,) : null,
    ),

  ),
);


Widget defaultTextButton({
  required String text,
  required function,
  required radius,
  double width = 250,
  double height=50,
  Color background = AppColors.aqua,
  bool isUpperCase = true,
  double textSize=16,
  Color textColor=Colors.white,
  FontWeight? fontWeight

})=>Container(
  height: height,
  width: width,
  child:   TextButton(
    onPressed: function,
    style: TextButton.styleFrom(
      backgroundColor: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
    child: Text(
      text,
      style:TextStyle(
          color: textColor,
          fontSize: textSize,
          fontWeight: fontWeight
      ) ,),),
);


navigateTo(context,widget)=>Navigator.push(context,
  MaterialPageRoute(
    builder:(context)=>widget,),);
navigateAndFinish(context,widget)=>Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context)=>widget),
        (route) => false);
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
