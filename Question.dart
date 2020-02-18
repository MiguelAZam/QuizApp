/**
 * Name: Question
 * Authors: Miguel A. Zamudio & Cristian Ayub
 * Description: Contains all methods that identify what kind of question we are
 * receiving from the server
 * Last update: Feb 2, 2020
 */

import './FillBlankQuestion.dart';
import './MultipleQuestion.dart';

class Question {
  var questionType;
  var answer;
  var question;

  /// Identifies question type.
  /// 
  /// Selects a way to retrieve such a question depending its type
  Question(type, question) {
    this.questionType = type;
    switch (type) {
      /// Type 2: Fill the blank
      case (2):
        this.question = FillBlankQuestion(question);
        this.answer = this.question.answer;
        break;
      /// Type 1: Multiple question
      case (1):
        this.question = MultipleQuestion(question);
        this.answer = this.question.answer;
        break;
      /// Otherwise: incorrect type of question
      default:
        this.question = null;
        this.answer = null;
        break;
    }
  }

  /// Checks the response given by the user depending on the type of question
  bool checkAnswer(dynamic response) {
    return question.checkAnswer(response);
  }

  /// Prints question depending on its type
  String toString(){
    return this.question.toString();
  }
}
