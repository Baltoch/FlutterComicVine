import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

enum CardType {
  movie,
  serie,
  comic,
  character;
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;
  static const double imageWidth = 180;
  static const double imageHeight = 177;
  static const double imageBorderRadius = 10;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(imageBorderRadius),
        topRight: Radius.circular(imageBorderRadius),
      ),
      child: Image.asset(
        image,
        width: imageWidth,
        height: imageHeight,
        fit: BoxFit.cover,
      ),
    );
  }
}

class CardTemplate extends StatelessWidget {
  const CardTemplate({super.key, required this.imageUrl});

  static const double cardWidth = 180;
  static const double cardHeight = 242;
  static const double cardBorderRadius = 10;
  static const Color cardBackgroundColor = Color(0xFF1E3243);
  static const double imageBorderRadius = 10;

  final String imageUrl;
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
        child: Column(
          children: <Widget>[
            ImageSection(image: imageUrl),
            const SizedBox(height: 15),
            const Text('Salut',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
          ],
        ),
      ),
    );
  }
}

// class ImageFromUrl extends StatelessWidget {
//   const ImageFromUrl({super.key, required this.imageUrl});

//   final String imageUrl;
//   static const double imageBorderRadius = 10;
//   static const double imageWidth = 180;
//   static const double imageHeight = 177;

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: const BorderRadius.only(
//         topLeft: Radius.circular(imageBorderRadius),
//         topRight: Radius.circular(imageBorderRadius),
//       ),
//       child: Image.network(
//         imageUrl,
//         width: imageWidth,
//         height: imageHeight,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }
