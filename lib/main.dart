import 'package:flutter/material.dart';
import 'package:game_of_thrones_quotes/api/got_service.dart';
import 'package:game_of_thrones_quotes/models/quotes.dart';
import 'package:get/get.dart';

import 'screens/quote_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GOT Quotes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuoteListScreen(title: 'Game of Thrones Quotes'),
    );
  }
}


