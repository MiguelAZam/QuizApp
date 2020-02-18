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

    if (newQuiz.wrongQuestions.length > 0) {
      int review = reviewWrongAnswers();
      print(Process.runSync("clear", [], runInShell: true).stdout); // Clear console
      if (review == 1) {
        newQuiz.printWrongAnswers();
      }
    }
    
    // print(Process.runSync("clear", [], runInShell: true).stdout); // Clear console

    int keepGoing = continueTraining();
    if (keepGoing == 0) {
      break;
    }
  }

  print(Process.runSync("clear", [], runInShell: true).stdout); // Clear console
  quitMsg();
}