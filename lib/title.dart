import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {

  const AppTitle({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: content,
        style: const TextStyle(
          fontSize: 32,
          color : Color(0xffffffff)
        )
      ),
    );
  }
}