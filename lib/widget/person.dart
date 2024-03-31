import 'package:flutter/material.dart';
import 'package:fluttercomicvine/utils/appcolors.dart';

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
            radius: 22.5,
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

class PersonSkeleton extends StatefulWidget {
  const PersonSkeleton({super.key});

  @override
  State<PersonSkeleton> createState() => _PersonSkeletonState();
}

class _PersonSkeletonState extends State<PersonSkeleton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorTween;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _colorTween = ColorTween(
      begin: AppColors.blueBlue,
      end: AppColors.section,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _colorTween.value,
                ),
              ),
              const SizedBox(width: 18),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 16,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                      color: _colorTween.value,
                    ),
                  ),
                  const SizedBox(height: 9),
                  Container(
                    height: 16,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                      color: _colorTween.value,
                    ),
                  )
                ],
              )
            ]
          );
        }
      )
    );
  }
}

