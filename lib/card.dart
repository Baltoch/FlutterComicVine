import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum CardType {
  movie,
  serie,
  comic,
  character;
}

class CardTemplate extends StatelessWidget {
  const CardTemplate({super.key});

  static const double cardWidth = 180;
  static const double cardHeight = 242;
  static const double cardBorderRadius = 10;
  static const Color cardBackgroundColor = Color(0xFF1E3243);
  static const double imageWidth = 180;
  static const double imageHeight = 177;

  // final Map<String, String> description;
  // final CardType type;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: cardWidth,
        height: cardHeight,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(cardBorderRadius)),
          color: cardBackgroundColor,
        ),
        child: const Center(
          child: Text(
            'Salut',
            style: TextStyle(fontFamily: 'Nunito', color: Colors.white),
          ),
        ),
      ),
    );
  }
}
