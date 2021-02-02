import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/homecontroller.dart';
import 'package:myteam_2/data/remote/services/apiservice.dart';
import 'package:myteam_2/models/profile.dart';
import 'package:myteam_2/ui/pages/profile/profile.dart' as Page;
import 'package:myteam_2/ui/pages/home.dart';

class ProfileController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController oldpass = TextEditingController();
  TextEditingController newpass = TextEditingController();
  TextEditingController connewpass = TextEditingController();
  int gender;
  File imageProfle;
  var data = Profile().obs;

  @override
  void onInit() {
    getData();
    // name.text = data.value.fullName;
    // address.text = data.value.address;
    // birthday.text = data.value.dateOfBirth;
    // phone.text = data.value.phoneNumber;
    // if (data.value.gender == "Male") {
    //   gender = 0;
    // } else {
    //   gender = 1;
    // }

    super.onInit();
  }

  getData() async {
    await ApiService().getProfile().then((value) {
      data.value = value.data;
    });
  }

  void edit() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    String gen = gender == 0 ? "Male" : "Female";
    Profile profile = Profile(
        fullName: name.text,
        address: address.text,
        phoneNumber: phone.text,
        dateOfBirth: birthday.text,
        gender: gen);

    await ApiService().editProfile(profile).then((value) {
      getData();
      Get.back();
      Get.back();
    }).catchError((e) {
      Get.back();
      print(e);
    });
  }

  changeImage() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    await ApiService().changeImgProfile(imageProfle).then((value) {});
  }

  changePass() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    await ApiService()
        .changePassword(oldpass.text, newpass.text, connewpass.text)
        .then((value) {
      if (value.code == "current_password_mismatch") {
        Get.back();
        Get.dialog(AlertDialog(
          content: Text(value.message),
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
        Get.back();
        Get.back();
        Get.back();
      }
    }).catchError((e) {
      Get.back();
      print(e);
    });
  }
}
