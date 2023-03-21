import 'package:flutter/material.dart';
import 'package:game_of_thrones_quotes/extensions.dart';

import '../api/got_service.dart';
import '../models/quotes.dart';

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({
    Key? key,
    required this.slug,
  }) : super(key: key);

  final String slug;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Name'),
      ),
      body: FutureBuilder<Character>(
        future: GotService().loadCharacter(slug),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            bool isDataOrNull = snapshot.data!.house.isDataOrNull;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 64.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshot.data!.name!,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.home,
                        color: Colors.grey,
                        size: 64.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            isDataOrNull ? 'N/A' : snapshot.data!.house!.name!,
                            style: const TextStyle(
                                fontSize: 20,),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          } else if (snapshot.hasError) {
            throw Exception(snapshot.error.toString());
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
