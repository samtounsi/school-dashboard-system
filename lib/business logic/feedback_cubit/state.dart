import 'package:web_schoolapp/data/models/feedBack_model.dart';

abstract class FeedbackState{}
class FeedbackInitialState extends FeedbackState{}

class FeedbackLoadingState extends FeedbackState{}
class FeedbackSuccessState extends FeedbackState{
  List<FeedBackModel>feedbacks;
  FeedbackSuccessState(this.feedbacks);

}
class FeedbackErrorState extends FeedbackState{
  String errorFeedback;
  FeedbackErrorState({required this.errorFeedback});}

