import 'FillBlankQuestion.dart';
import 'MultipleQuestion.dart';

class Question {
  var question;

  // Fill out question depending on the type selected
  Question({type, question, answer, options}) {
    switch (type) {
      case ("FillBlank"):
        this.question = FillBlankQuestion(question, answer);
        break;
      case ("MultipleQuestion"):
        this.question = MultipleQuestion(question, answer, options);
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
