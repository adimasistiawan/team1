import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/data/remote/services/apiservice.dart';
import 'package:myteam_2/ui/pages/navbarbottom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController username;
  TextEditingController password;
  TextEditingController email;
  bool alert;

  @override
  void onInit() {
    username = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    alert = false;
    super.onInit();
  }

  void login() async {
    ApiService apiService = ApiService();
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    await apiService.login(username.text, password.text).then((value) {
      Get.back();

      if (!value.isNull) {
        String token = value.accessToken;
        pref(token);

        Get.offAll(NavbarBottom());
      } else {
        Get.dialog(AlertDialog(
          content: Text("Account not registered"),
          actions: [
            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Get.back();
              },
            )
          ],
        ));
        alert = true;
      }

      update();
    });
  }

  forgetPassword() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    await ApiService().forgetPassword(email.text).then((value) {
      Get.back();
      if (!(value.message == null)) {
        print(value.message);
        if (value.message.toString() == "User not found") {
          Get.dialog(AlertDialog(
            content: Text("User not found"),
            actions: [
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Get.back();
                },
              )
            ],
          ));
        } else {
          Get.dialog(AlertDialog(
            content: Text("Failed. Try again"),
            actions: [
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Get.back();
                },
              )
            ],
          ));
        }
      } else {}
    }).catchError((e) {
      Get.back();
      Get.dialog(AlertDialog(
        content: Text("Failed."),
        actions: [
          FlatButton(
            child: Text("Ok"),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ));
      print(e);
    });
  }

  void pref(token) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', "Bearer " + token);
    pref.setBool("is_login", true);
    print(pref.getString('token'));
  }

  @override
  void onClose() {
    username?.dispose();
    password?.dispose();
    email?.dispose();
    super.onClose();
  }
}
