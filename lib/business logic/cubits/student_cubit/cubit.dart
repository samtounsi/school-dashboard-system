import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/student_cubit/states.dart';

class StudentCubit extends Cubit<DashBoardState> {
StudentCubit() : super(InitialState());

  static StudentCubit get(context) => BlocProvider.of(context);
  String? dropDown1;

  void changeGrade(String value) {
    dropDown1 = value;
    emit(ChangeGradeState());
  }

  String? dropDown2;

  void changeSection(String value) {
    dropDown2 = value;
    emit(ChangeSectionState());
  }

  String? newDate;

  void changeDate(String value) {
    newDate = value;
    emit(ChangeDateBirth());
  }

  String? gender;

  void changeGender(String value) {
    gender = value;
    emit(ChangeGenderState());
  }

  String? editP;

  void editProfile(String name) {
    editP = name;
  }

  final List<Map<String, dynamic>> _allUsers = [
    //List from back Api for all students and i will work filter search
    {
      "class": "7th",
      "name": "Andy Ali",
      "section": " section 1",
      "absent": false
    },
    {
      "class": "8th",
      "name": "Sandy Ahmad",
      "section": "section 5",
      "absent": false
    },
    {
      "class": "8th",
      "name": "sara Alo",
      "section": "section 6",
      "absent": false
    },
    {
      "class": "9th",
      "name": "Alia An",
      "section": "section 1",
      "absent": false
    },
    {
      "class": "8th",
      "name": "Abeer Barakat",
      "section": "section 1",
      "absent": false
    },
    {
      "class": "9th",
      "name": "Yumna Hashem",
      "section": "section 1",
      "absent": false
    },
    {
      "class": "7th",
      "name": "Fatima Alkalif",
      "section": "section 1",
      "absent": false
    },
    {
      "class": "7th",
      "name": "Sama Tounsi",
      "section": "section 1",
      "absent": false
    },
    {
      "class": "9th",
      "name": "Nour Ghanem",
      "section": "section 2",
      "absent": true
    },
    {
      "class": "7th",
      "name": "lara fa ",
      "section": "section 1",
      "absent": false
    },
    {"class": "9th", "name": "Razan", "section": "section 8", "absent": true},
    {"class": "8th", "name": "iman", "section": "section 8", "absent": false},
    {"class": "7th", "name": "alaa", "section": "section 10", "absent": true},
    {"class": "9th", "name": "hassan", "section": "section 9", "absent": false},
    {"class": "8th", "name": "mona", "section": "section 1", "absent": false},
    {"class": "7th", "name": "raneem", "section": "section 3", "absent": true},
    {"class": "7th", "name": "ahmad", "section": "section 4", "absent": false},
    {"class": "9th", "name": "ola", "section": "section 5", "absent": false},
    {"class": "8th", "name": "maria", "section": "section 6", "absent": false},
    {"class": "9th", "name": "ghader", "section": "section 8", "absent": true},
    {"class": "7th", "name": "doha", "section": "section 7", "absent": true},
    {
      "class": "8th",
      "name": "ghofran",
      "section": "section 10",
      "absent": false
    },
  ];
  List<Map<String, dynamic>> foundUsers = [];

  void getList() {
    foundUsers = _allUsers;
    emit(AllDataState());
  }

  void runFilter(String gradeValue, String sectionValue, String nameValue) {
    List<Map<String, dynamic>> results = [];
    if (nameValue.isEmpty && sectionValue.isEmpty && gradeValue.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      getList();
    } else {
      results = _allUsers
          .where((user) =>
              user["class"].contains(gradeValue) &&
              user["section"].contains(sectionValue) &&
              user["name"].toLowerCase().contains(nameValue.toLowerCase())

      )
          .toList();
      foundUsers = results;
      emit(SearchFilteredState());
      // we use the toLowerCase() method to make it case-insensitive
    }
  }

  List<Map<String, dynamic>> sectionUser = [];

  void section(String section) {
    List<Map<String, dynamic>> studentSection = [];
    studentSection = _allUsers
        .where((element) => element["section"].contains(section))
        .toList();
    sectionUser = studentSection;
    emit(StudentSectionState());
  }

  final List<String> nameAttendance = [];

  void toggleCheck(String name) {
    final isExist = nameAttendance.contains(name);
    if (isExist) {
      nameAttendance.remove(name);
    } else {
      nameAttendance.add(name);
    }
    emit(ToggleState());
  }

  bool isExist(String name) {
    final isExist = nameAttendance.contains(name);
    return isExist;
  }

bool isPassword = true;
IconData suffix = Icons.visibility_outlined;
void changePasswordVisibility()
{
  isPassword = !isPassword;
  suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

  emit(StudentChangePasswordVisibilityState());
}
bool isActive=false;
void activeCheck(bool active)
{
  isActive=active;

  emit(ActiveState());

}

// bool? isChecked = false;
// int cIndex = 0;
//
// void checkAttendance(bool value, int index) {
//   isChecked = value;
//   cIndex = index;
//   emit(CheckBoxState());
// }
//
// bool isSelected = false;
// IconData check = Icons.check_box_outline_blank;
//
// void checkA(bool isAttendance) {
//   isSelected = isAttendance;
//   check = isSelected ? Icons.check_box : Icons.check_box_outline_blank;
//
//   emit(AttendanceState());
// }
//
// Map<int, bool> selectedFlag = {};
// bool isSelectionMode = false;
//
// void onLongPress(bool isSelected, int index) {
//   selectedFlag[index] = !isSelected;
//   isSelectionMode = selectedFlag.containsValue(true);
//   emit(LongPressState());
// }
//
// void onTap(bool isSelected, int index) {
//   if (isSelectionMode) {
//     selectedFlag[index] = !isSelected;
//     isSelectionMode = selectedFlag.containsValue(true);
//   } else {
//     // Open Detail Page
//   }
//   emit(OnTapState());
// }
//
// Widget buildSelectIcon(bool isSelected, Map data) {
//   emit(ChangeIconState());
//   if (isSelectionMode) {
//     return Icon(
//       isSelected ? Icons.check_box : Icons.check_box_outline_blank,
//     );
//
//   } else {
//     return CircleAvatar(
//       child: Text('1'),
//     );
//   }
//
// }
}
