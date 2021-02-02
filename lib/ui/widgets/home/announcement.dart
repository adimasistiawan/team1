import 'package:flutter/material.dart';
import 'package:myteam_2/models/summary.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/utils/constant.dart';

class Announcement extends StatelessWidget {
  ListAnn listann;
  Announcement({this.listann});

  @override
  Widget build(BuildContext context) {
    int value = int.parse(listann.colorCode, radix: 16);
    Color otherColor = new Color(value);
    return Container(
      width: 200,
      height: 30,
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: otherColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: textWhite2,
                text: listann.title,
              ),
            ),
          ),
          Flexible(
            child: RichText(
              overflow: TextOverflow.clip,
              text: TextSpan(style: textWhite3, text: listann.expiredAt),
            ),
          ),
          SizedBox(height: 2),
          Flexible(
            child: RichText(
              overflow: TextOverflow.clip,
              text: TextSpan(style: textWhite3, text: listann.description),
            ),
          ),
        ],
      ),
    );
  }
}
