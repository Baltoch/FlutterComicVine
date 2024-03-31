import 'package:flutter/material.dart';
import '../utils/appcolors.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key, required this.title, required this.onClick});

  final String title;
  final Function(PointerDownEvent) onClick;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: onClick,
      child: Center(
        child: Container(
          height: 100,
          width: 300,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back_ios,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 20,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
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