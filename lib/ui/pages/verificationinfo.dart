import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/logincontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/ui/pages/login.dart';
import 'package:myteam_2/utils/constant.dart';

class Verification extends StatefulWidget {
  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
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
                  'Registration has been successful, please check your email for verification',
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
                      Text("Already have an account? ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800)),
                      GestureDetector(
                        onTap: () => Get.offAll(LoginPage()),
                        child: Text("Sign In",
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
