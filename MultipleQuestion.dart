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
}
