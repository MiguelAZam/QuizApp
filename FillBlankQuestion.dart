//Template class for fill the blank questions
class FillBlankQuestion {
  var stem;
  var answer;

  FillBlankQuestion(question) {
    this.stem = question["stem"];
    this.answer = question["answer"];
  }

  //Method to check if the response given by the user is correct
  //going though all possible answers
  bool checkAnswer(String response) {
    for (var i = 0; i < answer.length; i++) {
      if (response == this.answer) {
        return true;
      }
    }
    return false;
  }

  //TODO: Implement toString method to show question in the ui
  @override
  String toString() {
    print(this.stem);
    return null;
  }
}
