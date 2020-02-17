import './Quiz.dart';

void main() async {
  var myQuiz = Quiz("quiz01");
  await myQuiz.setup();
  myQuiz.start();
}
