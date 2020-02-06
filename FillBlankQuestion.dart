class FillBlankQuestion {
  var _description, _answer;

  FillBlankQuestion(this._description, this._answer);

  bool check(String response) {
    return response == this._answer;
  }
}
