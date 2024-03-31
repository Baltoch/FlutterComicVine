import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fluttercomicvine/utils/appcolors.dart';

class Story extends StatelessWidget {
  const Story({super.key, required this.description});

  final String? description;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(top: 25, left: 27, right: 27),
      child: HtmlWidget(
        description!,
        textStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
            fontFamily: 'Nunito',
            overflow: TextOverflow.clip),
      ),
    ));
  }
}
