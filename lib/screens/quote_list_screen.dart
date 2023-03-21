import 'package:flutter/material.dart';
import 'package:game_of_thrones_quotes/screens/character_detail_screen.dart';
import 'package:get/get.dart';

import '../api/got_service.dart';
import '../models/quotes.dart';

class QuoteListScreen extends StatefulWidget {
  const QuoteListScreen({super.key, required this.title});

  final String title;

  @override
  State<QuoteListScreen> createState() => _QuoteListScreenState();
}

class _QuoteListScreenState extends State<QuoteListScreen> {
  late Future<List<Quotes>> futureQuotes;

  @override
  void initState() {
    super.initState();
    futureQuotes = GotService().loadQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Quotes>>(
        future: futureQuotes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
              padding: const EdgeInsets.all(16),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    String naviSlug = snapshot.data![index].character!.slug!;
                    Get.to(CharacterDetailScreen(slug: naviSlug));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        snapshot.data![index].sentence ??
                            'When you play the game of thrones, you win or you die.',
                        style: const TextStyle(
                          fontFamily: 'Cinzel',
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text('- ${snapshot.data![index].character!.name ??
                          'Cersie'}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

void navigateToDetail(BuildContext context,String slug) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => CharacterDetailScreen(slug: slug,),
    ),
  );
}