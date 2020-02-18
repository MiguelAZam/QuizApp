/**
 * Name: QuizAppUI
 * Authors: Miguel A. Zamudio & Cristian Ayub
 * Description: Contains all methods that allow the creation of the UI.
 * Last update: Feb 2, 2020
 */

import 'dart:io';

/// Welcomes user to QuizApp
String intro() {
  print('////////////////////////////////////////////');
  print('/////////// Welcome to QuizApp /////////////');
  print('////////////////////////////////////////////');
  print('...Press any key to start...');
  return stdin.readLineSync();
}

/// Asks user whether she/he wants to solve more quizzes
int continueTraining() {
  print('Do you wish to continue with other quiz?');
  print('0: No');
  print('1: Yes');
  stdout.write('Answer: ');
  int answer = 0;
  try {
    answer = int.parse(stdin.readLineSync());
  } catch (FormatException) {
    answer = 0;
  }
  return answer;
}

/// Asks user whether she/he want to review wrong answered questions
int reviewWrongAnswers() {
  print('Review wrong questions?');
  print('0: No');
  print('1: Yes');
  stdout.write('Answer: ');
  int answer = 0;
  try {
    answer = int.parse(stdin.readLineSync());
  } catch (FormatException) {
    answer = 0;
  }
  return answer;
}

/// Allows user to see her/his score at the end of a quiz
void evaluate(int score, totalQuestions) {
  stdout.write('Total score: ');
  stdout.write(score);
  stdout.write('/');
  stdout.writeln(totalQuestions);
}

/// Confirms the user she/he has exited the program successfully
void quitMsg() {
  print('Thank you for using QuizApp! :D');
}
