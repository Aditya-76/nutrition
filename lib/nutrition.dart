import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NutritionData {
  String dish;
  String calories;

  NutritionData(this.dish, this.calories);

  factory NutritionData.fromJson(dynamic json) {
    return NutritionData("${json['dish']}", "${json['calories']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
        'dish': dish,
        'calories': calories,
      };
}

// Google App Script Web URL.
const String url =
    "https://script.google.com/macros/s/AKfycbx3niQdDqiqC4U9R8HqgjhJAAjqECe00Tcg7F8Ju-N1bu6jJbMAmxaQJDfvhKPDht9j/exec";

// Success Status Message
const STATUS_SUCCESS = "SUCCESS";

Future<List<NutritionData>> getNutritionData() async {
  return await http.get(Uri.parse(url)).then((response) {
    var jsonFeedback = convert.jsonDecode(response.body) as List;
    return jsonFeedback.map((json) => NutritionData.fromJson(json)).toList();
  });
}
