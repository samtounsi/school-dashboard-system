import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:web_schoolapp/business%20logic/cubits/home_cubit/states.dart';

class WebHomeCubit extends Cubit<WebHomeStates> {
  WebHomeCubit() : super(WebHomeInitState());

  static WebHomeCubit get(context) => BlocProvider.of(context);

  void getHomeWebData() {
    emit(WebHomeLoadingState());
    //http get method
  }

  DateTime? startExam = DateTime(2023, 5, 1);
  DateTime? endExam = DateTime(2023, 5, 6);

  List<DateTime> holiday = [
    DateTime(2023, 5, 1),
    DateTime(2023, 5, 17),
  ];

  List<DateTime> holidaysOfYear = [
    DateTime(2023, 5, 1),
    DateTime(2023, 5, 17),
    DateTime(2023, 5, 16),
    DateTime(2023, 5, 13)
  ];

  bool isSame(int a, int b) {
    if (a == b)
      return true;
    else
      return false;
  }

  bool isYearHoliday(DateTime day) {
    return holidaysOfYear.any((element) => (isSameDay(element, day)));
  }

  bool isHoliday(DateTime day) {
    return holiday.any((element) =>
        (isSame(element.day, day.day) && isSame(element.month, day.month)));
  }
}
