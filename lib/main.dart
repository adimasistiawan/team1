import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/ui/pages/login.dart';
import 'package:myteam_2/ui/pages/navbarbottom.dart';
import 'package:myteam_2/ui/pages/profile/companyprofile/company.dart';
import 'package:myteam_2/ui/pages/home.dart';
import 'package:myteam_2/ui/pages/menu.dart';
import 'package:myteam_2/ui/pages/profile/profile.dart';
import 'package:myteam_2/controllers/constantcontroller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String a;
  final SharedPreferences pref = await SharedPreferences.getInstance();
  a = pref.getString('token');
  runApp(MyApp(
    token: a,
  ));
}

class MyApp extends StatelessWidget {
  String token;
  MyApp({this.token});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: Duration(milliseconds: 300),
      home: token == null ? LoginPage() : NavbarBottom(),
    );
  }
}
