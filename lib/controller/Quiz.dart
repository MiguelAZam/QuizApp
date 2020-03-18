import 'package:quiz_app/controller/RequestQuiz.dart';
import 'package:quiz_app/model/Question.dart';

class Quiz {
  String error;
  String name;
  List<dynamic> questions;
  bool isEvaluation = false;
  int pos = 0; //Actual position
  int correct = 0; //Correct answers
  List<dynamic> incorrect = List<dynamic>(); //Keep track of incorrect answers
  List<dynamic> currentList; //List of questions or list of incorrect answers

  Quiz();

  Future<bool> startQuiz(String user, String pin, int quiz) async {
    Map data = {"user": user, "pin": pin, "quiz": quiz};
    RequestQuiz requester = RequestQuiz();
    var receivedQuiz = await requester.getQuiz(data);
    if (receivedQuiz == null) {
      this.error = requester.error;
      return false;
    }
    this.name = receivedQuiz["name"];
    this.questions = List<dynamic>();
    receivedQuiz["question"].forEach((item) {
      var question = Question(item);
      questions.add(question);
    });
    this.currentList = this.questions;
    return true;
  }

  void startEvaluation() {
    this.isEvaluation = true;
    this.pos = 0;
    this.currentList = this.incorrect;
  }

  Map getCurrent() {
    Map questionData;
    if (isEvaluation) {
      var currentIncorrect = this.currentList[pos];
      var incorrectQuestion = this.questions[currentIncorrect["index"]];
      questionData = {
        'type': incorrectQuestion.question.type,
        'stem': incorrectQuestion.question.stem,
        'figure': incorrectQuestion.question.figure,
        'answer': incorrectQuestion.question.answer,
        'option': incorrectQuestion.question.option,
        'incorrect': currentIncorrect["answer"],
      };
    } else {
      var currentQuestion = this.currentList[pos];
      questionData = {
        'type': currentQuestion.question.type,
        'stem': currentQuestion.question.stem,
        'figure': currentQuestion.question.figure,
        'option': currentQuestion.question.option,
      };
    }
    return questionData;
  }

  double getProgress() {
    return this.pos / this.currentList.length;
  }

  void checkAnswer(dynamic answer) {
    if (isEvaluation) return;

    if (!questions[pos].checkAnswer(answer)) {
      incorrect.add({
        'index': this.pos,
        'answer': answer,
      });
    } else {
      this.correct++;
    }
  }

  bool previous() {
    if (this.pos > 0) {
      this.pos = this.pos - 1;
      return true;
    }
    return false;
  }

  bool next() {
    if (this.pos < this.currentList.length - 1) {
      this.pos = this.pos + 1;
      return true;
    }
    return false;
  }

  Map evaluate() {
    Map evaluation = {
      'correct': this.correct,
      'incorrect': this.incorrect.length,
      'grade': (this.correct / this.questions.length) * 100,
    };
    return evaluation;
  }
}
