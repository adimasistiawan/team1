import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/logincontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/ui/pages/createcompany.dart';
import 'package:myteam_2/ui/pages/joincompany.dart';
import 'package:myteam_2/ui/pages/register.dart';
import 'package:myteam_2/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class Choose extends StatefulWidget {
  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(18, 100, 18, 0),
            child: Column(
              children: [
                // Container(
                //   margin: EdgeInsets.only(bottom: 20),
                //   child: Text(
                //     "MyTeam",
                //     style: TextStyle(
                //       color: blue,
                //       fontSize: 25,
                //       fontWeight: FontWeight.w900,
                //     ),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.only(bottom: 20),
                //   child: Text(
                //     "Sign In",
                //     style: TextStyle(
                //       color: blue,
                //       fontSize: 18,
                //       fontWeight: FontWeight.w700,
                //     ),
                //   ),
                // ),
                Column(
                  children: [
                    SizedBox(height: 16),
                    SizedBox(
                        width: double.infinity, // specific value
                        child: MaterialButton(
                            color: blue,
                            splashColor: Colors.white,
                            height: 45,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Create Company',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Get.to(CreateCompany());
                            })),
                    SizedBox(height: 16),
                    Text(
                      "Or",
                      style: TextStyle(
                        color: blue,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                        width: double.infinity, // specific value
                        child: MaterialButton(
                            color: Colors.white,
                            splashColor: Colors.white,
                            height: 45,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Join Company',
                              style: TextStyle(
                                fontSize: 20,
                                color: blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Get.to(JoinCompany());
                            })),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => Get.to(logout()),
                      child: Text(
                        "Sign Out",
                        style: TextStyle(
                          color: red,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Get.offAll(LoginPage());
  }
}
