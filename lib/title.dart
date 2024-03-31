import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {

  const AppTitle({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
        color : Colors.white,
        fontFamily: 'Nunito'
      ),
    );
  }
}