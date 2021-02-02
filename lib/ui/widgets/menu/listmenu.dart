import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/shared/theme.dart';

class ListMenu extends StatelessWidget {
  Widget redirect;
  String text;
  IconData icon;
  ListMenu({this.redirect, this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(redirect),
      child: Container(
        padding: EdgeInsets.only(top: 5),
        height: 90.0,
        width: 82.0,
        margin: EdgeInsets.only(right: 10, left: 1),
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
              height: 50.0,
              width: 50.0,
              padding: EdgeInsets.only(top: 10),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(80.0),
              ),
              child: Icon(
                icon,
                size: 40,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                text,
                style: textBlack3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
