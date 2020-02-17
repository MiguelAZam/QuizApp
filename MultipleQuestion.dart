class MultipleQuestion {
  var _description, _answer, _options;

  MultipleQuestion(this._description, this._answer, this._options);

  bool check(String response) {
    return this._options[response] == this._answer;
  }
}
