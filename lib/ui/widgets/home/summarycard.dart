import 'package:flutter/material.dart';
import 'package:myteam_2/shared/theme.dart';

class SummaryCard extends StatelessWidget {
  String number;
  String text;
  Color color;
  SummaryCard({this.number, this.text, this.color});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(5)),
          Text(
            number,
            style: textWhite,
          ),
          Text(
            text,
            style: textWhite2,
          )
        ],
      ),
    );
  }
}
