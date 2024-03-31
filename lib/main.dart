import 'package:fluttercomicvine/card.dart';
import 'package:fluttercomicvine/slider.dart';

import 'comicvine_model.dart';
import 'comicvine_api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ComicVineRequestTester(),
    );
  }
}

class ComicVineRequestTester extends StatelessWidget {
  const ComicVineRequestTester({super.key});

  static List<CardTemplate> cardList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ComicVine API'),
      ),
      body: FutureBuilder(
        future: ComicVineRequests().getIssues(),
        builder: (_, AsyncSnapshot<ComicVineIssuesResponse> req) {
          if (req.hasError) {
            return Text('Une erreur est survenue : ${req.error}');
          } else if (!req.hasData) {
            return const CircularProgressIndicator();
          } else {
            for (var i = 0; i < 5; i++) {
              cardList.add(CardTemplate(
                  imagePath: req.data!.results[i].image?['small_url'],
                  name: req.data!.results[i].name,
                  issueNumber: req.data!.results[i].issueNumber,
                  volume: req.data!.results[i].volume?['name']));
            }
            return CardSlider(
                title: "Comics populaires",
                hasButton: true,
                cardItem: cardList);
          }
        },
      ),
    );
  }
}
//Text('${req.data!.results[0].name}')

// CardTemplate(
//                 imagePath: req.data!.results[0].image?['small_url'],
//                 name: req.data!.results[0].name,
//                 issueNumber: req.data!.results[0].issueNumber,
//                 volume: req.data!.results[0].volume?['name']);
