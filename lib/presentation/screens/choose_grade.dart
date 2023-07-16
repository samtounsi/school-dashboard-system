// // ignore_for_file: prefer_const_constructors
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:web_schoolapp/presentation/components%20and%20constants/components.dart';
// import 'package:web_schoolapp/presentation/components%20and%20constants/constants.dart';
// import 'package:web_schoolapp/presentation/screens/add_attendance_screen.dart';
//
//
// class ChooseGradeScreen extends StatelessWidget {
//   const ChooseGradeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           Spacer(),
//           Column(
//             children: [
//               Spacer(),
//               text('Choose Grade:', size: 35),
//               Spacer(),
//               defaultTextButton(
//                   text: 'Seventh Grade',
//                   width: 500,
//                   height: 100,
//                   function: () {
//                     navigateTo(context, AttendanceScreen());
//                   },
//                   radius: 20,
//                   background: Colors.white,
//                   borderColor: AppColors.darkBlue,
//                   textColor: AppColors.darkBlue,
//                   textSize: 30),
//               Spacer(),
//               defaultTextButton(
//                   text: 'Eighth Grade',
//                   width: 500,
//                   height: 100,
//                   function: () {
//                     navigateTo(context, AttendanceScreen());
//                   },
//                   radius: 20,
//                   background: Colors.white,
//                   borderColor: AppColors.darkBlue,
//                   textColor: AppColors.darkBlue,
//                   textSize: 30),
//               Spacer(),
//               defaultTextButton(
//                   text: 'Ninth Grade',
//                   width: 500,
//                   height: 100,
//                   function: () {
//                     navigateTo(context, AttendanceScreen());
//                   },
//                   radius: 20,
//                   background: Colors.white,
//                   borderColor: AppColors.darkBlue,
//                   textColor: AppColors.darkBlue,
//                   textSize: 30),
//               Spacer(),
//               Spacer(),
//             ],
//           ),
//           Spacer(),
//           SvgPicture.asset(
//             'images/Nerd-amicoAqua.svg',
//             width: 600,
//             height: 600,
//           ),
//           Spacer(),
//         ],
//       ),
//     );
//   }
// }
