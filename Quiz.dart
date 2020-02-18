import './QuizAPI.dart';
import './Question.dart';
import 'dart:io';

class Quiz {
  var quiz;                               // Quiz obtained form server
  var quizName;                           // Quiz name
  List<Question> questions = [];          // Quiz questions
  List<Question> wrongQuestions = [];     // Wrong answered questions
  List<dynamic> wrongAnswers = [];        // Wrong answers
  int score = 0;                          // Correct answered questions
  int totalQuestions = 0;                 // Total of answered questions

  // Constructor
  Quiz(this.quiz);

  // Retrieve quiz from server
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
  }

  // Start solving the quiz
  void start() {
    for (var i = 0; i < this.questions.length; i++) {
      print(Process.runSync("clear", [], runInShell: true).stdout); // Clear console

      // Write question
      stdout.write(i+1);
      stdout.write(') ');
      questions[i].toString();
      stdout.write('Answer: ');

      // Evaluate answer depending on the question type
      if(questions[i].questionType == 1) {
        // Multiple choice question
        var answer = int.parse(stdin.readLineSync());
        assert(answer is int);
        if (questions[i].checkAnswer(answer)){
          score++;
        } else {
          wrongQuestions.add(questions[i]);
          wrongAnswers.add(answer);
        }
      } else {
        // Fill-in-the-blank question
        String answer = stdin.readLineSync();
        if (questions[i].checkAnswer(answer)){
          score++;
        } else {
          wrongQuestions.add(questions[i]);
          wrongAnswers.add(answer);
        }
      }
      totalQuestions++;
    }
  }

  void printWrongAnswers() {
    for(int i = 0; i < wrongQuestions.length; i++) {
      stdout.write(i+1);
      stdout.write(') ');
      wrongQuestions[i].toString();
      stdout.writeln('');
      stdout.write('Your answer: ');
      print(wrongAnswers[i]);
      stdout.write('Correct answer: ');
      print(wrongQuestions[i].answer);
      stdout.writeln('');
    }
  }
}
