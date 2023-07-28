import 'package:web_schoolapp/data/models/add_event_response_model.dart';
import 'package:web_schoolapp/data/models/event_model.dart';

import '../../../data/models/delete_event_model.dart';

abstract class EventWebStates{}
class EventWebInitState extends EventWebStates{}

class AddEventWebLoadingState extends EventWebStates{}

class AddEventWebSuccessState extends EventWebStates
{
   final AddEventResponseModel addEventResponseModel;

  AddEventWebSuccessState(this.addEventResponseModel);
}

class AddEventWebErrorState extends EventWebStates
{
  final String error;

  AddEventWebErrorState({required this.error});
}

class ShowEventWebLoadingState extends EventWebStates{}

class ShowEventWebSuccessState extends EventWebStates
{
  final EventModel eventModel;

  ShowEventWebSuccessState(this.eventModel);
}

class ShowEventWebErrorState extends EventWebStates
{
  final String error;

  ShowEventWebErrorState({required this.error});
}

class DeleteEventWebLoadingState extends EventWebStates{}

class DeleteEventWebSuccessState extends EventWebStates
{
  final DeleteEventModel deleteEventModel;

  DeleteEventWebSuccessState(this.deleteEventModel);
}

class DeleteEventWebErrorState extends EventWebStates
{
  final String error;

  DeleteEventWebErrorState({required this.error});
}