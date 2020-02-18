import 'dart:io';

String intro() {
  print('////////////////////////////////////////////');
  print('/////////// Welcome to QuizApp /////////////');
  print('////////////////////////////////////////////');
  print('...Press any key to start...');
  return stdin.readLineSync();
}

int continueTraining(){
  print('Do you wish to continue with other quiz?');
  print('0: No');
  print('1: Yes');
  stdout.write('Answer: ');
  int asnwer = int.parse(stdin.readLineSync());
  assert(asnwer is int);
  return asnwer;
}

int reviewWrongAnswers(){
  print('Review wrong questions?');
  print('0: No');
  print('1: Yes');
  stdout.write('Answer: ');
  int asnwer = int.parse(stdin.readLineSync());
  assert(asnwer is int);
  return asnwer;
}

void evaluate(int score, totalQuestions){
  stdout.write('Total score: ');
  stdout.write(score);
  stdout.write('/');
  stdout.writeln(totalQuestions);
}

void quitMsg() {
  print('Thank you for using QuizApp! :D');
}