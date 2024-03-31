import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection(
      {super.key,
      required this.name,
      required this.volume,
      required this.issueNumber});

  final String? name;
  final String? volume;
  final String? issueNumber;

  static const Color textColor = Colors.white;
  static const double fontSizeText = 16;
  static const FontWeight fontWeightText = FontWeight.w400;
  static const double containerWidth = 156;
  static const double containerHeight = 44;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      padding: EdgeInsets.zero,
      child: Text(
        '${volume ?? ''} ${issueNumber == null ? '' : '#$issueNumber'} ${name == null ? '' : '-$name'}',
        maxLines: 2,
        style: const TextStyle(
          color: textColor,
          fontFamily: 'Nunito',
          fontSize: fontSizeText,
          fontWeight: fontWeightText,
          overflow: TextOverflow.ellipsis,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

class CardTemplate extends StatelessWidget {
  const CardTemplate(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.issueNumber,
      required this.volume});

  static const double cardWidth = 180;
  static const double cardHeight = 242;
  static const double cardBorderRadius = 10;
  static const Color cardBackgroundColor = Color(0xFF284C6A);
  static const double imageBorderRadius = 10;

  final String imagePath;
  final String? name;
  final String? volume;
  final String? issueNumber;
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
            ImageFromUrl(imageUrl: imagePath),
            const SizedBox(height: 12),
            Align(
              child: DescriptionSection(
                  name: name, volume: volume, issueNumber: issueNumber),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageFromUrl extends StatelessWidget {
  const ImageFromUrl({super.key, required this.imageUrl});

  final String imageUrl;
  static const double imageBorderRadius = 10;
  static const double imageWidth = 180;
  static const double imageHeight = 177;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(imageBorderRadius),
        topRight: Radius.circular(imageBorderRadius),
      ),
      child: Image.network(
        imageUrl,
        width: imageWidth,
        height: imageHeight,
        fit: BoxFit.cover,
      ),
    );
  }
}


// enum CardType {
//   movie,
//   serie,
//   comic,
//   character;
// }

// class ImageSection extends StatelessWidget {
//   const ImageSection({super.key, required this.image});

//   final String image;
//   static const double imageWidth = 180;
//   static const double imageHeight = 177;
//   static const double imageBorderRadius = 10;

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: const BorderRadius.only(
//         topLeft: Radius.circular(imageBorderRadius),
//         topRight: Radius.circular(imageBorderRadius),
//       ),
//       child: Image.asset(
//         image,
//         width: imageWidth,
//         height: imageHeight,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }

