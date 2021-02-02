import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/data/remote/services/apiservice.dart';
import 'package:myteam_2/models/checkin.dart';
import 'package:myteam_2/models/teamview.dart';
import 'package:myteam_2/models/workload.dart';

class TeamviewController extends GetxController {
  var data = List<TeamView>().obs;
  var workload = List<Workload>().obs;
  var checkin = List<Checkin>().obs;
  @override
  void onInit() {
    getData();
    getWorkload();
    getCheckin();
    super.onInit();
  }

  getData() async {
    await ApiService().getTeamview().then((value) {
      data.value = value.data;
    }).catchError((onError) {
      print(onError);
    });
  }

  getWorkload() async {
    await ApiService().getWorkload().then((value) {
      workload.value = value.data;
    }).catchError((onError) {
      print(onError);
    });
  }

  getCheckin() async {
    await ApiService().getCheckin().then((value) {
      checkin.value = value.data;
    }).catchError((onError) {
      print(onError);
    });
  }
}
