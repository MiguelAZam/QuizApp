import 'dart:io';

String intro() {
  print('////////////////////////////////////////////');
  print('/////////// Welcome to QuizApp /////////////');
  print('////////////////////////////////////////////');
  print('...Press any key to start...');
  return stdin.readLineSync();
}


