import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_schoolapp/business%20logic/cubits/event_cubit/states.dart';
import 'package:web_schoolapp/presentation/classes/event.dart';

class EventWebCubit extends Cubit<EventWebStates> {
  EventWebCubit() : super(EventWebInitState());

  static EventWebCubit get(context) => BlocProvider.of(context);
  
  List<Event> events = [
    Event(title: 'Quiz', date: '20/2/2023', time: '10:01', description: 'Math'),
    Event(title: 'Quiz', date: '20/2/2023', time: '10:01', description: 'Math'),
    Event(title: 'Quiz', date: '20/2/2023', time: '10:01', description: 'Math'),
    Event(title: 'Quiz', date: '20/2/2023', time: '10:01', description: 'Math'),
    Event(title: 'Quiz', date: '20/2/2023', time: '10:01', description: 'Math'),
    Event(title: 'Quiz', date: '20/2/2023', time: '10:01', description: 'Math'),
    Event(title: 'Quiz', date: '20/2/2023', time: '10:01', description: 'Math'),
    Event(title: 'Quiz', date: '20/2/2023', time: '10:01', description: 'Math'),
  ];
}
