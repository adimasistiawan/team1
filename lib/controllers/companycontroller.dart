import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/data/remote/services/apiservice.dart';
import 'package:myteam_2/models/company.dart';
import 'package:myteam_2/ui/pages/navbarbottom.dart';
import 'package:myteam_2/ui/pages/profile/companyprofile/company.dart';

class CompanyController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController website = TextEditingController();
  TextEditingController oldpass = TextEditingController();
  TextEditingController newpass = TextEditingController();
  TextEditingController connewpass = TextEditingController();
  TextEditingController company_code = TextEditingController();
  TextEditingController emailinvite = TextEditingController();
  File imageLogo;
  var data = CompanyProfile().obs;

  @override
  void onInit() {
    super.onInit();
  }

  create() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    CompanyProfile company = CompanyProfile(
        companyName: name.text,
        address: address.text,
        contact: contact.text,
        website: website.text,
        password: newpass.text);

    await ApiService().createCompany(company).then((value) {
      Get.offAll(NavbarBottom());
    }).catchError((e) {
      Get.back();
      Get.dialog(AlertDialog(
        content: Text("Fail."),
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

  join() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    await ApiService()
        .joinCompany(company_code.text, newpass.text)
        .then((value) {
      Get.back();
      if (!(value.message == null)) {
        print(value.message);
        if (value.message.toString() == "The company not registered yet") {
          Get.dialog(AlertDialog(
            content: Text("The company not registered yet"),
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
            content: Text("Join Company Failed. Try again"),
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
        content: Text("Join Company Fail."),
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

  invite() async {
    Get.back();
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    await ApiService().invite(emailinvite.text).then((value) {
      Get.back();
      if (!(value.message == null)) {
        print(value.message);
        Get.dialog(AlertDialog(
          content: Text(value.message.toString()),
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
          content: Text("Invite Failed. Try again"),
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
    }).catchError((e) {
      Get.back();
      Get.dialog(AlertDialog(
        content: Text("Invite Failed. Try again."),
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

  getData() async {
    await ApiService().getCompanyProfile().then((value) {
      data.value = value.data;
    });
  }

  edit() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    CompanyProfile company = CompanyProfile(
        companyName: name.text,
        address: address.text,
        contact: contact.text,
        website: website.text);

    await ApiService().editCompany(company).then((value) {
      getData();
      Get.back();
      Get.back();
      Get.to(CompanyPage());
    }).catchError((e) {
      Get.back();
      print(e);
    });
  }

  changeLogo() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    await ApiService().changeImgLogo(imageLogo).then((value) {});
  }

  changePass() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    await ApiService()
        .changePasswordCompany(oldpass.text, newpass.text, connewpass.text)
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
        Get.to(CompanyPage());
      }
    }).catchError((e) {
      Get.back();
      print(e);
    });
  }
}
