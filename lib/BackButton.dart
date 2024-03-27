import 'package:flutter/material.dart';
import 'appcolors.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return  Center
    (
        child: Container(
          height: 100,
          width: 300,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 20,
            ),
            Text(
            title,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
              fontFamily: 'Nunito',
            ),
            )
          ]
          )
      )
    );
  }
}