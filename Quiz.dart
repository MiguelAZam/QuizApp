import './QuizAPI.dart';
import './Question.dart';

class Quiz {
  var quiz;
  var quizName;
  List<Question> questions = [];

  Quiz(this.quiz);

  void setup() async {
    var receivedQuiz = await QuizAPI().getQuiz(this.quiz);
    if (receivedQuiz != null) {
      this.quizName = receivedQuiz["name"];
      for (int i = 0; i < receivedQuiz["question"].length; i++) {
        var currentQuestion = receivedQuiz["question"][i];
        Question question = Question(currentQuestion["type"], currentQuestion);
        this.questions.add(question);
      }
    }
    //questions[1].toString();   // FIXME!!
  }

  void start() {
    // for (int i = 0; i < this.questions.length; i++) {
    //   print(this.questions[i].toString());
    // }
    // setup();
    // questions[0].toString();   // FIXME!!
  }
}
