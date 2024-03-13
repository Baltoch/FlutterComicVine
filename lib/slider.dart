import 'package:flutter/material.dart';
import 'package:fluttercomicvine/card.dart';

const List<CardTemplate> cardItem = [
  CardTemplate(
      imagePath: 'assets/images/image5.jpg',
      description: 'The Sliver Surfer #16 - In the Hands of ... Mephisto!'),
  CardTemplate(
      imagePath: 'assets/images/image1.jpg',
      description: 'Wonder Woman #89 - Home'),
  CardTemplate(
      imagePath: 'assets/images/image2.jpg',
      description: 'Chamber of Chill Magazine #13 - The Lost Race'),
  CardTemplate(
      imagePath: 'assets/images/image3.jpg',
      description: 'Fighting Fronts! #3'),
  CardTemplate(
      imagePath: 'assets/images/image4.jpg', description: 'Tomb of Terror'),
];

class SliderTitle extends StatelessWidget {
  const SliderTitle({super.key, required this.content});

  final String content;

  static const Color textColor = Colors.white;
  static const double fontSizeText = 20;
  static const FontWeight fontWeightText = FontWeight.w700;
  static const double containerWidth = 205;
  static const double containerHeight = 27;

  static const double dotRaduis = 10;
  static const Color dotColor = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: Row(
        children: <Widget>[
          Container(
            width: dotRaduis,
            height: dotRaduis,
            decoration: const BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 9),
          Text(
            content,
            style: const TextStyle(
              color: textColor,
              fontFamily: 'Nunito',
              fontSize: fontSizeText,
              fontWeight: fontWeightText,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({super.key});

  static const double buttonWidth = 92;
  static const double buttonHeight = 32;
  static const double buttonBorderRadius = 10;
  static const Color buttonBackgroundColor = Colors.black;

  static const Color textColor = Colors.white;
  static const double fontSizeText = 14;
  static const FontWeight fontWeightText = FontWeight.w600;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(buttonBorderRadius)),
          color: buttonBackgroundColor,
        ),
        child: TextButton(
          onPressed: () {},
          child: const Text(
            "Voir plus",
            style: TextStyle(
              color: textColor,
              fontFamily: 'Nunito',
              fontSize: fontSizeText,
              fontWeight: fontWeightText,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}

class CardSlider extends StatelessWidget {
  const CardSlider({super.key, required this.title, required this.hasButton});

  final String title;
  final bool hasButton;

  static const double sliderWidth = 424;
  static const double sliderHeight = 329;
  static const double sliderBorderRadius = 20;
  static const Color sliderBackgroundColor = Color(0xFF1E3243);

  Widget header({required bool hasButton, required String title}) {
    if (hasButton) {
      return Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 17),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: SliderTitle(content: title)),
            const SeeMoreButton(),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 17),
        child: Align(
          alignment: Alignment.centerLeft,
          child: SliderTitle(content: title),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: sliderHeight,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(sliderBorderRadius)),
          color: sliderBackgroundColor,
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 22),
            header(hasButton: hasButton, title: title),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: index == 0 ? 10 : 0),
                        child: cardItem[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(width: 10),
                  itemCount: cardItem.length),
            ),
          ],
        ),
      ),
    );
  }
}
