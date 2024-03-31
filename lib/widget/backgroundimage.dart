import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttercomicvine/utils/appcolors.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Expanded(
            child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        )),
        Expanded(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Container(color: AppColors.backgroundImage),
          ),
        ),
      ],
    );
  }
}
