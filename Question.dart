import 'FillBlankQuestion.dart';

class Question {
  var question;

  Question({type, description, answer, options}) {
    switch (type) {
      case ("FillBlank"):
        this.question = FillBlankQuestion(description, answer);
        break;
      case ("MultipleQuestion"):
        this.question = MultipleQuestion(description, answer, options);
        break;
      default:
        this.question = null;
        break;
    }
  }

  bool check(String response) {
    return question.check(response);
  }
}
