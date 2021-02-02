import 'package:get/get.dart';
import 'package:myteam_2/data/remote/services/apiservice.dart';
import 'package:myteam_2/models/dashboard.dart';

class DashboardController extends GetxController {
  var data = Dashboard().obs;
  var approved = List<DataChart>().obs;
  var rejected = List<DataChart>().obs;
  var waiting = List<DataChart>().obs;
  @override
  void onInit() {
    getData();

    super.onInit();
  }

  getData() async {
    await ApiService().getDashboard().then((value) {
      data.value = value;
      int a = 1;
      value.datasetApproved.forEach((element) {
        approved.add(DataChart(date: a, qty: element));
        a++;
      });
      a = 1;
      value.datasetRejected.forEach((element) {
        rejected.add(DataChart(date: a, qty: element));
        a++;
      });
      a = 1;
      value.datasetWaiting.forEach((element) {
        waiting.add(DataChart(date: a, qty: element));
        a++;
      });
    });
  }
}

class DataChart {
  DataChart({this.date, this.qty});
  final int date;
  final int qty;
}
