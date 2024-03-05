import 'package:flutter/material.dart';

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
      width: containerWidth,
      height: containerHeight,
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
  const CardSlider({super.key, required this.title});

  final String title;

  static const double sliderWidth = 424;
  static const double sliderHeight = 329;
  static const double sliderBorderRadius = 20;
  static const Color sliderBackgroundColor = Color(0xFF1E3243);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: sliderWidth,
        height: sliderHeight,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(sliderBorderRadius)),
          color: sliderBackgroundColor,
        ),
        child: const SeeMoreButton(),
      ),
    );
  }
}
