import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  const Information(
      {super.key, required this.title, required this.description});

  final String title;
  final List<String> description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
          width: 196,
          child: Text(
            title,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Nunito',
              fontSize: 17,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
            ),
          )),
      title: ListView.builder(
          shrinkWrap: true,
          itemCount: description.length,
          itemBuilder: (BuildContext context, int index) {
            return Expanded(
              child: Text(
                description[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
              ),
            );
          }),
    );
  }
}
