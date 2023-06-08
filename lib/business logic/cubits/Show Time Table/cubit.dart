
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/Show%20Time%20Table/states.dart';
import 'package:web_schoolapp/presentation/classes/lessons.dart';



class  ShowTimetableCubit extends Cubit< ShowTimetableStates>{
  ShowTimetableCubit():super ( ShowTimetableInitialState());

  static  ShowTimetableCubit get(context)=>BlocProvider.of(context);

  String classValue='7th';
  String changeClass(value) {
    this.classValue = value;
    print(value);
    emit(ClassChangeClassState());
    return value;
  }

  String sectionValue='1';
  String changeSection(value) {
    this.sectionValue = value;
    print(value);
    emit(ClassChangeSectionState());
    return value;
  }
  List<Lessons> lesson= [
      Lessons(day: 'Sun', first: '', second: '', third: '', fourth: '', fifth: '', sixth: '',),
      Lessons(day: 'Mon', first: '', second: '', third: '', fourth: '', fifth: '', sixth: '' ),
      Lessons(day: 'Tue', first: '', second: '', third: '', fourth: '', fifth: '', sixth: '' ),
      Lessons(day: 'Tue',first: '', second: '', third: '', fourth: '', fifth: '', sixth: '' ),
      Lessons(day: 'Tue', first: '', second: '', third: '', fourth: '', fifth: '', sixth: '' ),


  ];
  List<Lessons> getTable({required String grade,required String section})
  {
    lesson.replaceRange(0, 5, [
      Lessons(day: 'Sun', first: 'first', second: 'second', third: 'third', fourth: 'fourth', fifth: 'fifth', sixth: 'sixth',),
      Lessons(day: 'Mon', first: 'first', second: 'second', third: 'third', fourth: 'fourth', fifth: 'fifth', sixth: 'sixth' ),
      Lessons(day: 'Tue', first: 'first', second: 'second', third: 'third', fourth: 'fourth', fifth: 'fifth', sixth: 'sixth',),
      Lessons(day: 'Tue', first: 'first', second: 'second', third: 'third', fourth: 'fourth', fifth: 'fifth', sixth: 'sixth'),
      Lessons(day: 'Tue', first: 'first', second: 'second', third: 'third', fourth: 'fourth', fifth: 'fifth', sixth: 'sixth'),

    ]);
    emit(ClassGetTableSuccessState());
    return lesson;
  }

}
