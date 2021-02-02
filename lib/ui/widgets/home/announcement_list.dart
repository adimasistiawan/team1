import 'package:flutter/material.dart';
import 'package:myteam_2/models/summary.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/utils/constant.dart';

class AnnouncementList extends StatelessWidget {
  ListAnn listAnn;
  AnnouncementList({this.listAnn});
  @override
  Widget build(BuildContext context) {
    int value = int.parse(listAnn.colorCode, radix: 16);
    Color otherColor = new Color(value);
    return Container(
      width: 200,
      height: 110,
      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
      margin: EdgeInsets.only(top: 10),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: textWhite2,
                text: listAnn.title,
              ),
            ),
          ),
          Flexible(
            child: RichText(
              overflow: TextOverflow.clip,
              text: TextSpan(style: textWhite3, text: listAnn.expiredAt),
            ),
          ),
          SizedBox(height: 2),
          Flexible(
            child: RichText(
              overflow: TextOverflow.fade,
              text: TextSpan(style: textWhite3, text: listAnn.description),
            ),
          ),
        ],
      ),
    );
  }
}
