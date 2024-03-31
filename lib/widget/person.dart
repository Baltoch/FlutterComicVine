import 'package:flutter/material.dart';

class Person extends StatelessWidget {
  const Person({super.key, required this.name, this.title, required this.imageURL, required this.onClick});

  final String name;
  final String? title;
  final String imageURL;
  final void Function(PointerDownEvent) onClick;

  Widget hasTitle() {
    if(title != null) {
      return Text(
        title ?? '',
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontSize: 17,
          fontStyle: FontStyle.italic
        )
      );
    }
    else {
      return const SizedBox(height: 0, width: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: onClick,
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(imageURL)
          ),
          const SizedBox(width: 18),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 17
                )
              ),
              hasTitle()
            ],
          )
        ]
      )
    );
  }
}