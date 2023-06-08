
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/timetable_cubit/states.dart';

//import 'package:project/presentation/screens/time_table.dart';
//import '../../../presentation/classes/lessons.dart';
//import '../../../presentation/classes/teacher.dart';
//import '../../../presentation/screens/showtimetable.dart';

class TimetableCubit extends Cubit<TimetableStates>
{
      TimetableCubit():super(TimetableInitialState());
      static TimetableCubit get(context)=>BlocProvider.of(context);

      String classValue='7th';
      String changeClass(value) {
        this.classValue = value;
        print(value);
        emit(TimetableChangeClassState());
        return value;
      }

      String sectionValue='1';
      String changeSection(value) {
        this.sectionValue = value;
        print(value);
        emit(TimetableChangeSectionState());
        return value;
      }

      String? arabicValue;
      String changeArabicTeacher(value) {
        this.arabicValue = value;
        print(value);
        emit(TimetableChangeArabicTeacherState());
        return value;
      }

      String? englishValue;
      String changeEnglishTeacher(value) {
        this.englishValue = value;
        print(value);
        emit(TimetableChangeEnglishTeacherState());
        return value;
      }
      String? frenchValue;
      String changeFrenchTeacher(value) {
        this.frenchValue = value;
        print(value);
        emit(TimetableChangeFrenchTeacherState());
        return value;
      }

      String? mathValue;
      String changeMathTeacher(value) {
        this.mathValue = value;
        print(value);
        emit(TimetableChangeMathTeacherState());
        return value;
      }

      String? physicsValue;
      String changePhysicsTeacher(value) {
        this.physicsValue = value;
        print(value);
        emit(TimetableChangePhysicsTeacherState());
        return value;
      }

      String? chemistryValue;
      String changeChemistryTeacher(value) {
        this.chemistryValue = value;
        print(value);
        emit(TimetableChangeChemistryTeacherState());
        return value;
      }

      String? artValue;
      String changeArtTeacher(value) {
        this.artValue = value;
        print(value);
        emit(TimetableChangeArtTeacherState());
        return value;
      }


      String? musicValue;
      String changeMusicTeacher(value) {
        this.musicValue = value;
        print(value);
        emit(TimetableChangeMusicTeacherState());
        return value;
      }


      String? sportsValue;
      String changeSportsTeacher(value) {
        this.sportsValue = value;
        print(value);
        emit(TimetableChangeSportsTeacherState());
        return value;
      }


      String? socialValue;
      String changeSocialTeacher(value) {
        this.socialValue = value;
        print(value);
        emit(TimetableChangeSocialTeacherState());
        return value;
      }


      String? cultureValue;
      String changeCultureTeacher(value) {
        this.cultureValue = value;
        print(value);
        emit(TimetableChangeCultureTeacherState());
        return value;
      }

      String? religionValue;
      String changeReligionTeacher(value) {
        this.religionValue = value;
        print(value);
        emit(TimetableChangeReligionTeacherState());
        return value;
      }

      String? philosophyValue;
      String changePhilosophyTeacher(value) {
        this.philosophyValue = value;
        print(value);
        emit(TimetableChangePhilosophyTeacherState());
        return value;
      }


      String? scienceValue;
      String changeScienceTeacher(value) {
        this.scienceValue = value;
        print(value);
        emit(TimetableChangeScienceTeacherState());
        return value;
      }


      String? technologyValue;
      String changeTechnologyTeacher(value) {
        this.technologyValue = value;
        print(value);
        emit(TimetableChangeTechnologyTeacherState());
        return value;
      }
      postTimetable( {
        required String grade,
        required String section,
        required List sundayLessons,
        required List mondayLessons,
        required List tuesdayLessons,
        required List wednesdayLessons,
        required List thursdayLessons,
        required String arabicTeacher,
        required String englishTeacher,
        required String frenchTeacher,
        required String mathTeacher,
        required String physicsTeacher,
        required String chemistryTeacher,
        required String artTeacher,
        required String musicTeacher,
        required String sportsTeacher,
        required String socialTeacher,
        required String cultureTeacher,
        required String religionTeacher,
        required String philosophyTeacher,
        required String scienceTeacher,
        required String technologyTeacher,
}
)
      {
        print(grade);
        print(section);
        print(sundayLessons.toString());
        print(mondayLessons.toString());
        print(tuesdayLessons.toString());
        print(wednesdayLessons.toString());
        print(thursdayLessons.toString());
        print(arabicTeacher);
        print(englishTeacher);
        print(frenchTeacher);
        print(mathTeacher);
        print(physicsTeacher);
        print(chemistryTeacher);
        print(artTeacher);
        print(musicTeacher);
        print(sportsTeacher);
        print(socialTeacher);
        print(cultureTeacher);
        print(religionTeacher);
        print(philosophyTeacher);
        print(scienceTeacher);
        print(technologyTeacher);
      }

}