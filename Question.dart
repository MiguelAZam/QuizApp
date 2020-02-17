import './FillBlankQuestion.dart';
import './MultipleQuestion.dart';

//Factory class to cast questions depending of
//type given by the response from the server
class Question {
  var questionType;
  var question;

  Question(type, question) {
    this.questionType = type;
    switch (type) {
      //Type 1 = Fill the blank
      case (1):
        this.questionType = FillBlankQuestion(question);
        break;
      //Type 2 = Multiple question
      case (2):
        this.questionType = MultipleQuestion(question);
        break;
      //Otherwise, incorrect type of question
      default:
        this.questionType = null;
        break;
    }
  }

  //Method to check if the response given by the user
  //IMPORTANT: I'm assuming that the response can be
  //either int (multiple question) or string (fill the blank)
  bool checkAnswer(dynamic response) {
    return question.checkAnswer(response);
  }

  //TODO: Implement toString method to show question in the ui
}
