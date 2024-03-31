import 'package:flutter/material.dart';
import '../utils/appcolors.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Icon(
        Icons.arrow_back_ios,
        color: AppColors.white,
        size: 24,
      ),
      Padding(
          padding: const EdgeInsets.only(left: 21),
          child: Text(
            title,
            style: const TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontFamily: 'Nunito',
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w700),
          ))
    ]);
  }
}
