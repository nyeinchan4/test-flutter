import 'dart:convert';
import 'dart:math';

import '../models/quotes.dart';
import 'package:http/http.dart' as http;

class QuotesService {

  Future<List<Quotes>> loadQuotes() async {
    final response = await http
        .get(Uri.parse('https://api.gameofthronesquotes.xyz/v1/random/20'));

    final body = jsonDecode(response.body) as List;
    if (response.statusCode == 200) {
      final quoteList = body.map((json) => Quotes.fromJson(json)).toList();
      return quoteList;
    } else {
      throw Exception('Failed to load Quotes');
    }
  }
}
