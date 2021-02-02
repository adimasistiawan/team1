import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/teamviewcontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/utils/constant.dart';

class WorkloadPage extends StatefulWidget {
  @override
  _WorkloadPageState createState() => _WorkloadPageState();
}

class _WorkloadPageState extends State<WorkloadPage> {
  final TeamviewController _teamviewController = Get.put(TeamviewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cloud,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Team Workload",
          style: textBlack2,
        ),
      ),
      body: Obx(
        () => _teamviewController.workload == null
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
                child: Column(
                  children: [
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: _teamviewController.workload.length,
                        itemBuilder: (context, index) {
                          return Container(
                              width: double.infinity,
                              padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
                              margin: EdgeInsets.only(top: 15),
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20.0,
                                      backgroundImage: NetworkImage(_teamviewController
                                                  .workload[index]
                                                  .imageProfile ==
                                              "http://172.104.161.39/myteam/public/raw/profile"
                                          ? "https://thumbs.dreamstime.com/b/default-avatar-photo-placeholder-profile-icon-eps-file-easy-to-edit-default-avatar-photo-placeholder-profile-icon-124557887.jpg"
                                          : _teamviewController
                                              .workload[index].imageProfile),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _teamviewController
                                                .workload[index].fullName,
                                            style: textBlack3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 90,
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      margin:
                                          EdgeInsets.only(top: 10, right: 12),
                                      decoration: new BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: leaf,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Done",
                                            style: textWhite3,
                                          ),
                                          Text(
                                            _teamviewController.workload[index]
                                                        .totalTaskDone ==
                                                    null
                                                ? "0"
                                                : _teamviewController
                                                    .workload[index]
                                                    .totalTaskDone
                                                    .toString(),
                                            style: textWhite3,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 90,
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      margin:
                                          EdgeInsets.only(top: 10, right: 12),
                                      decoration: new BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: yellow,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Progress",
                                            style: textWhite3,
                                          ),
                                          Text(
                                            _teamviewController.workload[index]
                                                        .totalProgress ==
                                                    null
                                                ? "0"
                                                : _teamviewController
                                                    .workload[index]
                                                    .totalProgress
                                                    .toString(),
                                            style: textWhite3,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 90,
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      margin: EdgeInsets.only(top: 10),
                                      decoration: new BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: blue,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Task",
                                            style: textWhite3,
                                          ),
                                          Text(
                                            _teamviewController.workload[index]
                                                        .totalTask ==
                                                    null
                                                ? "0"
                                                : _teamviewController
                                                    .workload[index].totalTask
                                                    .toString(),
                                            style: textWhite3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ]));
                        },
                      ),
                    ),
                  ],
                )),
      ),
    );
  }
}
