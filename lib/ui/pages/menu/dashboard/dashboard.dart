import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/dasboardcontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/utils/constant.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DashboardController _dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cloud,
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: black, //change your color here
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Dashboard",
            style: textBlack2,
          ),
        ),
        body: Obx(() => _dashboardController.data.value.tgl == null
            ? Center(child: CircularProgressIndicator())
            : ListView(children: [
                Container(
                  padding: EdgeInsets.fromLTRB(12, 18, 12, 0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "This month summary",
                              style: textBlack4,
                            ),
                            Text(
                              _dashboardController.data.value.tgl,
                              style: textBlack4,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 150,
                                  padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: purple,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _dashboardController
                                            .data.value.boxCountTeam,
                                        style: textWhite3,
                                      ),
                                      Text(
                                        "Team",
                                        style: textWhite3,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.blue[300],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _dashboardController
                                            .data.value.boxCountTaskReport,
                                        style: textWhite3,
                                      ),
                                      Text(
                                        "Task Report",
                                        style: textWhite3,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
                        margin: EdgeInsets.only(top: 10),
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              _dashboardController
                                      .data.value.labelCountCheckinWfh +
                                  " Check-in WFH",
                              style: textBlack4,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 150,
                                  padding: EdgeInsets.fromLTRB(10, 26, 10, 26),
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: blue,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _dashboardController
                                            .data.value.boxCount2TotalPekerjaan,
                                        style: textWhite3,
                                      ),
                                      Text(
                                        "Total Task",
                                        style: textWhite3,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  padding: EdgeInsets.fromLTRB(10, 26, 10, 26),
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: leaf,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _dashboardController
                                            .data.value.boxCount2Approved,
                                        style: textWhite3,
                                      ),
                                      Text(
                                        "Approved",
                                        style: textWhite3,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 150,
                                  padding: EdgeInsets.fromLTRB(10, 26, 10, 26),
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: red,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _dashboardController
                                            .data.value.boxCount2Ditolak,
                                        style: textWhite3,
                                      ),
                                      Text(
                                        "Rejected",
                                        style: textWhite3,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: yellow,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _dashboardController.data.value
                                            .boxCount2MenungguValidasi,
                                        style: textWhite3,
                                      ),
                                      Container(
                                        width: 100,
                                        child: Text(
                                          "Waiting Validation",
                                          style: textWhite3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
                          margin: EdgeInsets.only(top: 10),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(children: [
                            SfCartesianChart(
                                primaryXAxis: CategoryAxis(),
                                enableSideBySideSeriesPlacement: false,
                                // Chart title
                                title: ChartTitle(text: 'Task Frequency'),
                                // Enable legend
                                legend: Legend(isVisible: false),
                                // Enable tooltip
                                tooltipBehavior: TooltipBehavior(enable: false),
                                series: <LineSeries<DataChart, int>>[
                                  LineSeries<DataChart, int>(
                                    color: leaf,
                                    dataSource: _dashboardController.approved,
                                    xValueMapper: (DataChart data, _) =>
                                        data.date,
                                    yValueMapper: (DataChart data, _) =>
                                        data.qty,
                                  ),
                                  LineSeries<DataChart, int>(
                                    color: red,
                                    dataSource: _dashboardController.rejected,
                                    xValueMapper: (DataChart data, _) =>
                                        data.date,
                                    yValueMapper: (DataChart data, _) =>
                                        data.qty,
                                    // Enable data label
                                  ),
                                  LineSeries<DataChart, int>(
                                    color: yellow,
                                    dataSource: _dashboardController.waiting,
                                    xValueMapper: (DataChart data, _) =>
                                        data.date,
                                    yValueMapper: (DataChart data, _) =>
                                        data.qty,
                                    // Enable data label
                                  )
                                ])
                          ]))
                    ],
                  ),
                )
              ])));
  }
}
