import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/homecontroller.dart';
import 'package:myteam_2/data/remote/services/apiservice.dart';
import 'package:myteam_2/models/summary.dart';
import 'package:myteam_2/ui/pages/announcement_all.dart';
import 'package:myteam_2/ui/pages/create_ann.dart';
import 'package:myteam_2/ui/pages/home.dart';

class AnnouncementController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController validuntil = TextEditingController();
  Color color = Colors.blue;

  void createAnn() {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    Color newcolor = color;
    String colorString = newcolor.toString();
    String valueString = colorString.split('(0x')[1].split(')')[0];
    print(valueString);
    ListAnn ann = ListAnn(
        title: title.text,
        description: description.text,
        expiredAt: validuntil.text,
        colorCode: valueString.toUpperCase());

    ApiService().createAnnouncement(ann).then((value) {
      Get.back();
      Get.back();
      HomeController _homecontroller = Get.put(HomeController());
      _homecontroller.getData();
    }).catchError((e) {
      Get.back();
      print(e);
    });
  }

  @override
  void onClose() {
    title.dispose();
    description.dispose();
    validuntil.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
