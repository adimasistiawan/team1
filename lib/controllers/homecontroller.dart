import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/data/remote/services/apiservice.dart';
import 'package:myteam_2/models/summary.dart';
import 'package:myteam_2/ui/pages/choose.dart';
import 'package:myteam_2/ui/pages/createcompany.dart';

class HomeController extends GetxController {
  var data = Data().obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    await ApiService().getCompanyProfile().then((value) {
      print(value);
      if (!(value == null)) {
        ApiService().getSummary().then((val) {
          data.value = val.data;
        });
      } else {
        Get.offAll(Choose());
      }
    });

    update();
  }
}
