import 'FillBlankQuestion.dart';

class Question {
  var questionType;

  Question({type, question, answer, options}) {
    switch (type) {
      case ("FillBlank"):
        this.questionType = FillBlankQuestion(question, answer);
        break;
      case ("MultipleQuestion"):
        this.questionType = MultipleQuestion(question, answer, options);
        break;
      default:
        this.questionType = null;
        break;
    }
  }

  bool check(String response) {
    return questionType.check(response);
  }
}
