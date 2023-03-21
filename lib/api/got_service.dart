import 'dart:convert';
import 'dart:math';

import '../models/quotes.dart';
import 'package:http/http.dart' as http;

const BASE_API = 'https://api.gameofthronesquotes.xyz/v1/';

class GotService {
  Future<List<Quotes>> loadQuotes() async {
    final response = await http.get(Uri.parse('$BASE_API/random/20'));

    final body = jsonDecode(response.body) as List;
    if (response.statusCode == 200) {
      final quoteList = body.map((json) => Quotes.fromJson(json)).toList();
      return quoteList;
    } else {
      throw Exception('Failed to load Quotes');
    }
  }

  Future<Character> loadCharacter(String slug) async {
    final response = await http.get(Uri.parse('$BASE_API/character/$slug'));

    final body = jsonDecode(response.body) as List;
    if (response.statusCode == 200) {
      final characterList = body.map((e) => Character.fromJson(e)).toList();
      return characterList[0];
    } else {
      throw Exception('Failed to load Characters');
    }
  }
}
