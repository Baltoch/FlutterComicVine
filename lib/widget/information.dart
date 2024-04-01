import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  const Information({super.key, required this.data});

  final Map<String, List<String>> data;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 21, left: 23, right: 23),
        alignment: Alignment.topCenter,
        child: Table(
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.top,
            children: data.entries.map((e) {
              return TableRow(
                children: <Widget>[
                  Text(
                    e.key,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Nunito',
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 21, left: 18),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.from(e.value.map(
                            (element) {
                              return Text(
                                element,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Nunito',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                ),
                              );
                            },
                          ))))
                ],
              );
            }).toList()));
  }
}
