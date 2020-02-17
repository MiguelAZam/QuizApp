class MultipleQuestion {
  var stem;
  var answer;
  var option;

  MultipleQuestion(Map<String, dynamic> question) {
    this.stem = question["stem"];
    this.answer = question["answer"];
    this.option = question["option"];
  }

  bool checkAnswer(int response) {
    return response == this.answer;
  }
}
