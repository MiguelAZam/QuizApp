import 'QuizAppUI.dart';
import 'Quiz.dart';
import 'dart:io';

main(List<String> args) async {
  String startRequest;

  while(startRequest  == null){
    startRequest = intro();
  }
  
  print(Process.runSync("clear", [], runInShell: true).stdout); // Clear console

  var quizzes = ['quiz01', 'quiz02', 'quiz03'];

  for(int i = 0; i < quizzes.length; i++){
    Quiz newQuiz = new Quiz(quizzes[i]);
    await newQuiz.setup();
    newQuiz.start();

    print(Process.runSync("clear", [], runInShell: true).stdout); // Clear console

    evaluate(newQuiz.score, newQuiz.totalQuestions);
    stdout.writeln('');
    int review = reviewWrongAnswers();
    if (review == 1) {
      
    }
    int keepGoing = continueTraining();
    if (keepGoing == 0) {
      break;
    }
  }

  quitMsg();
}