/**
 * Name: Main
 * Authors: Miguel A. Zamudio & Cristian Ayub
 * Description: Contains funtionality on how the whole program will be run.
 * Last update: Feb 2, 2020
 */

import '../lib/controller/Quiz.dart';

/// Main method that triggers everything
main(List<String> args) async {
  var quiz = Quiz();
  //TODO: Try with an incorrect user or password
  var success = await quiz.startQuiz("mazamudioarias", "6593", 0);
  print(quiz.getCurrentQuestion());
  print(quiz.getProgress());
  quiz.updateAnswer(2);
  quiz.next();
  print(quiz.getCurrentQuestion());
  print(quiz.getProgress());
  quiz.updateAnswer("Drawer");
  print(quiz.evaluate());
  quiz.startReview();
  print(quiz.getCurrentIncorrect());
  print(quiz.getProgress());
}
