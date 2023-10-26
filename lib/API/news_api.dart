import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApi {
  final String apiKey = '68a09c7f1e504358a0ecbb2cbe76c500';
  final String baseUrl = 'https://newsapi.org/v2';

  Future<Map<String, dynamic>> fetchTeslaNews() async {
    final response = await http.get(Uri.parse('$baseUrl/top-headlines?country=in&category=health&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
