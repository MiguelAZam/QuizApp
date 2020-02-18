/**
 * Name: MultipleQuestion
 * Authors: Miguel A. Zamudio & Cristian Ayub
 * Description: Contains all methods that allow the creation and management of
 * a multiple choice question
 * Last update: Feb 2, 2020
 */

import 'dart:io';

class MultipleQuestion {
  var stem;
  var answer;
  var option;

  /// Contructor
  /// 
  /// Receives a Map @question of type <String, dynamic>
  /// and populates @stem, @answer, and @option
  MultipleQuestion(Map<String, dynamic> question) {
    this.stem = question["stem"];
    this.answer = question["answer"];
    this.option = question["option"];
  }

  /// Checks if the response given by the user is correct
  bool checkAnswer(int response) {
    return response == this.answer;
  }

  /// Prints the question along with its answer options
  @override
  String toString() {
    print(this.stem);
    for(var i = 0; i < this.option.length; i++) {
      stdout.write('\t');
      stdout.write(i+1);
      stdout.writeln(') ' + this.option[i]);
    }
    return null;
  }
}
