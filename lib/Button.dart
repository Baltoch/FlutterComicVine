import 'package:flutter/material.dart';
import 'appcolors.dart';


class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold
    (
      body: Center(
        child: Container
        (
          height: 100,
          width: 250,
          decoration: BoxDecoration
          (
                color: AppColors.seeMoreBackgroundColor,
                borderRadius: BorderRadius.circular(30.0),
          ),
        child: const Center(
          child: Text(
            'Voir plus',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40
            ),
            )
          )
        )
      )
    );
  }
}