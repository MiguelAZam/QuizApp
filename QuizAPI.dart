import 'dart:collection';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class QuizAPI {
  final String BASE_URL = "http://www.cs.utep.edu/cheon/cs4381/homework/quiz";

  Future<Map<String, dynamic>> getQuiz(String quizName) async {
    var url = '$BASE_URL?quiz=$quizName';
    var resp = await http.get(url);
    Map<String, dynamic> jsonResponse = convert.jsonDecode(resp.body);
    if (jsonResponse["response"]) {
      return jsonResponse["quiz"];
    } else {
      var errorReason = jsonResponse["reason"];
      print('Error: $errorReason');
      return null;
    }
  }
}
