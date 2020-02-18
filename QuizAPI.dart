/**
 * Name: QuizAPI
 * Authors: Miguel A. Zamudio & Cristian Ayub
 * Description: Contains methods that allow the connection to the server
 * Last update: Feb 2, 2020
 */

import 'dart:collection';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class QuizAPI {
  /// Part of the URL that never changes
  final String BASE_URL = "http://www.cs.utep.edu/cheon/cs4381/homework/quiz";

  /// Retrieves a specific quiz depeding on @quizName 
  /// 
  /// Returns the quiz in the form of a map
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
