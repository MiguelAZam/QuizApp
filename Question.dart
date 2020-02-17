import './FillBlankQuestion.dart';
import './MultipleQuestion.dart';

class Question {
  var questionType;
  var question;

  Question(type, question) {
    this.questionType = type;
    switch (type) {
      case (1):
        this.questionType = FillBlankQuestion(question);
        break;
      case (2):
        this.questionType = MultipleQuestion(question);
        break;
      default:
        this.questionType = null;
        break;
    }
  }

  bool checkAnswer(dynamic response) {
    return question.checkAnswer(response);
  }
}
