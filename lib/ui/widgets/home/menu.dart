import 'package:flutter/material.dart';
import 'package:myteam_2/shared/theme.dart';

class Menu extends StatelessWidget {
  Widget redirect;
  String text;
  String icon;
  Menu({this.redirect, this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      height: 60.0,
      width: 70.0,
      margin: EdgeInsets.only(right: 5, left: 1),
      decoration: BoxDecoration(
        color: Colors.white,
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
        children: [
          Container(
            height: 35.0,
            width: 35.0,
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: new AssetImage(icon),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(80.0),
            ),
          ),
          Text(
            text,
            style: textBlack3,
          )
        ],
      ),
    );
  }
}
