import 'package:flutter/material.dart';
import '../utils/appcolors.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onClick});

  final Function(PointerDownEvent) onClick;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: onClick,
      child: Center(
        child: Container(
          height: 100,
          width: 250,
          decoration: BoxDecoration(
            color: AppColors.seeMoreBackgroundColor,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: const Center(
            child: Text(
              'Voir plus',
              style: TextStyle(color: Colors.white, fontSize: 40),
            )
          )
        )
      )
    );
  }
}
