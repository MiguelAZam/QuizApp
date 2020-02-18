import './FillBlankQuestion.dart';
import './MultipleQuestion.dart';

//Factory class to cast questions depending of
//type given by the response from the server
class Question {
  var questionType;
  var answer;
  var question;

  Question(type, question) {
    this.questionType = type;
    switch (type) {
      //Type 2 = Fill the blank
      case (2):
        this.question = FillBlankQuestion(question);
        this.answer = this.question.answer;
        break;
      //Type 1 = Multiple question
      case (1):
        this.question = MultipleQuestion(question);
        this.answer = this.question.answer;
        break;
      //Otherwise, incorrect type of question
      default:
        this.question = null;
        this.answer = null;
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
  String toString(){
    return this.question.toString();
  }
}
