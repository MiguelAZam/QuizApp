/**
 * Name: Main
 * Authors: Miguel A. Zamudio & Cristian Ayub
 * Description: Contains funtionality on how the whole program will be run.
 * Last update: Feb 2, 2020
 */

import 'QuizAppUI.dart';
import 'Quiz.dart';
import 'dart:io';

/// Main method that triggers everything
main(List<String> args) async {
  String startRequest;

  /// Start of quiz
  while(startRequest  == null){
    startRequest = intro();
  }
  
  print(Process.runSync("clear", [], runInShell: true).stdout); // Clear console

  var quizzes = ['quiz01', 'quiz02', 'quiz03'];

  /// Iterates through every quiz
  for(int i = 0; i < quizzes.length; i++){
    Quiz newQuiz = new Quiz(quizzes[i]);
    await newQuiz.setup();
    newQuiz.start();

    print(Process.runSync("clear", [], runInShell: true).stdout); // Clear console

    /// Evaluates user's score
    evaluate(newQuiz.score, newQuiz.totalQuestions);
    stdout.writeln('');

    /// Allows user to check wrong questions
    if (newQuiz.wrongQuestions.length > 0) {
      int review = reviewWrongAnswers();
      print(Process.runSync("clear", [], runInShell: true).stdout); // Clear console
      if (review == 1) {
        newQuiz.printWrongAnswers();
      }
    }
    
    /// Allows the user to continue solving quizzes
    int keepGoing = continueTraining();
    if (keepGoing == 0) {
      break;
    }
  }

  /// Exits QuizApp with an exit message
  print(Process.runSync("clear", [], runInShell: true).stdout); // Clear console
  quitMsg();
}