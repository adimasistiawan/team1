import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/logincontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/ui/pages/login.dart';
import 'package:myteam_2/utils/constant.dart';

class SuccessInfo extends StatefulWidget {
  @override
  _SuccessInfoState createState() => _SuccessInfoState();
}

class _SuccessInfoState extends State<SuccessInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(18, 100, 18, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Success. Please check your email',
                  style: textWhite,
                ),
                Text(
                  '',
                  style: textWhite2,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.offAll(LoginPage()),
                        child: Text("Back to Login Page",
                            style: TextStyle(
                                color: leaf, fontWeight: FontWeight.w800)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
