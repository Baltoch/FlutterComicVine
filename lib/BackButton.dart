import 'package:flutter/material.dart';
import 'appcolors.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold
    (
      body: Center(
        child: Container(
          height: 100,
          width: 300,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
        child: const Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.red,
              size: 35,
            ),
            Text(
            'Titre du film',
            style: TextStyle(
              color: Colors.red,
              fontSize: 39,
              fontFamily: 'Nunito',
            ),
            )
          ]
          )
        )
      )
    );
  }
}