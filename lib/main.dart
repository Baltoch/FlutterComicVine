import 'package:flutter/material.dart';
import './title.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'appcolors.dart';
import 'tabs.dart';
import 'Episode.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title:'flutterpjt',
      debugShowCheckedModeBanner: false,
      //home: MyEpisode(),
      home: Episode(),
    );

  }
}
