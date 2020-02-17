import 'QuizAppUI.dart';
import 'Quiz.dart';

main(List<String> args) {
  String startRequest;
  while(startRequest  == null){
    startRequest = intro();
  }
  
  var quizzes = ['quiz01', 'quiz02', 'quiz03'];

  Quiz newQuiz = new Quiz(quizzes[1]);
  newQuiz.setup();
  print(newQuiz.toString());
  // newQuiz.start();
}