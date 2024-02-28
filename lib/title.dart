import 'package:flutter/material.dart';

class Title extends StatelessWidget {

  const Title({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: content,
        style: const TextStyle(
          fontSize: 32
        )
      ),
    );
  }
}