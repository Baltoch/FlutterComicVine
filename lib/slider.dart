import 'package:flutter/material.dart';
import 'package:fluttercomicvine/card.dart';

class CardSlider extends StatelessWidget {
  const CardSlider({super.key});

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
      ),
    );
  }
}
