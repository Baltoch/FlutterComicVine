import 'package:flutter/material.dart';
import 'package:fluttercomicvine/utils/appcolors.dart';
import 'card.dart';

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
  final void Function() onClick;

  const SeeMoreButton({super.key, required this.onClick});

  static const double buttonWidth = 92;
  static const double buttonHeight = 32;
  static const double buttonBorderRadius = 10;
  static const Color buttonBackgroundColor = AppColors.seeMoreBackgroundColor;

  static const Color textColor = AppColors.white;
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
          onPressed: onClick,
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

class Header extends StatelessWidget {
  const Header({super.key, required this.hasButton, required this.title, required this.onSeeMoreClick});

  final void Function() onSeeMoreClick;
  final String title;
  final bool hasButton;

  @override
  Widget build(BuildContext context) {
    if (hasButton) {
      return Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 17),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: SliderTitle(content: title)),
            SeeMoreButton(onClick: onSeeMoreClick),
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
}

class CardSlider extends StatelessWidget {
  const CardSlider({super.key, required this.title, required this.hasButton, required this.cardList, required this.onSeeMoreClick});

  final String title;
  final bool hasButton;
  final List<CardTemplate> cardList;
  final void Function() onSeeMoreClick;

  static const double sliderWidth = 424;
  static const double sliderHeight = 329;
  static const double sliderBorderRadius = 20;
  static const Color sliderBackgroundColor = Color(0xFF1E3243);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: sliderHeight,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(sliderBorderRadius), bottomLeft: Radius.circular(sliderBorderRadius)),
          color: sliderBackgroundColor,
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 22),
            Header(hasButton: hasButton, title: title, onSeeMoreClick: onSeeMoreClick),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: index == 0 ? 10 : 0),
                        child: cardList[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(width: 10),
                  itemCount: cardList.length),
            ),
          ],
        ),
      ),
    );
  }
}

class CardSliderSkeleton extends StatefulWidget {
  const CardSliderSkeleton({super.key});

  @override
  State<CardSliderSkeleton> createState() => _CardSliderSkeletonState();
}

class _CardSliderSkeletonState extends State<CardSliderSkeleton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorTween;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _colorTween = ColorTween(
      begin: AppColors.section,
      end: AppColors.section50,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            height: 329,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
              color: _colorTween.value,
            ),
          );
        }
      )
    );
  }
}