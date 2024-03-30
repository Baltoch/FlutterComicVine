import 'package:flutter/material.dart';
import 'package:fluttercomicvine/utils/appcolors.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key, required this.header, required this.content});

  final List<String> header;
  final List<Widget> content;
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: content.length, 
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: const Color.fromARGB(153, 255, 255, 255),
            dividerColor: Colors.transparent,
            indicatorColor: AppColors.orange,
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            tabs: List<Tab>.generate(header.length, (i) => Tab(text: header[i]))
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.cardBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), 
                  topRight: Radius.circular(20)
                )
              ),
              child: TabBarView(
                children: content
              ),
            )
          )
        ],
      )
    );
  }
}