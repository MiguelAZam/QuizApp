import 'dart:io';

//Template class for Multiple questions
class MultipleQuestion {
  var stem;
  var answer;
  var option;

  MultipleQuestion(Map<String, dynamic> question) {
    this.stem = question["stem"];
    this.answer = question["answer"];
    this.option = question["option"];
  }

  //Method to check if the response given by the user is correct
  bool checkAnswer(int response) {
    return response == this.answer;
  }

  //TODO: Implement toString method to show question in the ui
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
