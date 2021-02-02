import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/data/remote/services/apiservice.dart';

class RegisterController extends GetxController {
  TextEditingController username;
  TextEditingController password;
  TextEditingController email;
  @override
  void onInit() {
    username = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    super.onInit();
  }

  void register() async {
    ApiService apiService = ApiService();
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    await apiService
        .register(username.text, email.text, password.text)
        .then((value) {
      print(value.errors.email.toString());
      Get.back();

      if (!(value.errors == null)) {
        if (value.errors.email.toString() ==
            "[The email has already been taken.]") {
          Get.dialog(AlertDialog(
            content: Text("The email has already been taken."),
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
            content: Text("Registration Fail, Try again"),
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

      update();
    });
  }
}
