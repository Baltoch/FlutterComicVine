import 'package:flutter/material.dart';

enum CardType {
  movie,
  serie,
  comic,
  character;
}

class SettingUpCard {
  static const int cardWidth = 180;
  static const int cardHeight = 242;
  static const int cardBorderRadius = 10;
  static const Color cardBackgroundColor = Color(0xFF1E3243);
  static const int imageWidth = 180;
  static const int imageHeight = 177;

  final Map<String, String> description;
  final CardType type;

  SettingUpCard({required this.description, required this.type});
}
