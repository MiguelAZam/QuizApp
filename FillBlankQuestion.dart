class FillBlankQuestion {
  var stem;
  var answer;

  FillBlankQuestion(question) {
    this.stem = question["stem"];
    this.answer = question["answer"];
  }

  bool checkAnswer(String response) {
    for (var i = 0; i < answer.length; i++) {
      if (response == this.answer) {
        return true;
      }
    }
    return false;
  }
}
