import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/homecontroller.dart';
import 'package:myteam_2/controllers/teamviewcontroller.dart';
import 'package:myteam_2/models/teamview.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/ui/pages/menu/teamview/checkin.dart';
import 'package:myteam_2/ui/pages/menu/teamview/workload.dart';

class TeamViewPage extends StatefulWidget {
  @override
  _TeamViewPageState createState() => _TeamViewPageState();
}

class _TeamViewPageState extends State<TeamViewPage> {
  List<TeamView> _searchResult = [];
  TextEditingController controller = new TextEditingController();
  final TeamviewController _teamviewController = Get.put(TeamviewController());
  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _teamviewController.data.forEach((a) {
      if (a.fullName.contains(text)) _searchResult.add(a);
    });

    setState(() {});
  }

  void handleClick(String value) {
    switch (value) {
      case 'Workload':
        Get.to(WorkloadPage());
        break;
      case 'Check-in Log':
        Get.to(CheckinPage());
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _teamviewController.getData();
    super.initState();
  }

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
          "Team View",
          style: textBlack2,
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Workload', 'Check-in Log'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Obx(
        () => _teamviewController.data == null
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: black,
                            width: 0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: black,
                            width: 0,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 13,
                        color: black,
                      ),
                      onChanged: onSearchTextChanged,
                    ),
                    Flexible(
                      child: _searchResult.length != 0 ||
                              controller.text.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: _searchResult.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    width: double.infinity,
                                    padding:
                                        EdgeInsets.fromLTRB(10, 18, 10, 18),
                                    margin: EdgeInsets.only(top: 15),
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0,
                                              2), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20.0,
                                            backgroundImage: NetworkImage(
                                                _searchResult[index]
                                                            .imageProfile ==
                                                        "http://172.104.161.39/myteam/public/raw/profile"
                                                    ? "https://thumbs.dreamstime.com/b/default-avatar-photo-placeholder-profile-icon-eps-file-easy-to-edit-default-avatar-photo-placeholder-profile-icon-124557887.jpg"
                                                    : _searchResult[index]
                                                        .imageProfile),
                                            backgroundColor: Colors.transparent,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _searchResult[index].fullName,
                                                  style: textBlack3,
                                                ),
                                                Text(
                                                  _searchResult[index]
                                                      .healthStatus,
                                                  style: textBlack3,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              _searchResult[index]
                                                      .totalTask
                                                      .toString() +
                                                  " Task and have done ",
                                              style: textGrey,
                                            ),
                                            Text(
                                              _searchResult[index]
                                                      .totalTaskDone
                                                      .toString() +
                                                  " Total Last Week",
                                              style: textBlue,
                                            ),
                                          ],
                                        ),
                                      )
                                    ]));
                              },
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: _teamviewController.data.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    width: double.infinity,
                                    padding:
                                        EdgeInsets.fromLTRB(10, 18, 10, 18),
                                    margin: EdgeInsets.only(top: 15),
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0,
                                              2), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 20.0,
                                            backgroundImage: NetworkImage(
                                                _teamviewController.data[index]
                                                            .imageProfile ==
                                                        "http://172.104.161.39/myteam/public/raw/profile"
                                                    ? "https://thumbs.dreamstime.com/b/default-avatar-photo-placeholder-profile-icon-eps-file-easy-to-edit-default-avatar-photo-placeholder-profile-icon-124557887.jpg"
                                                    : _teamviewController
                                                        .data[index]
                                                        .imageProfile),
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
                                                      .data[index].fullName,
                                                  style: textBlack3,
                                                ),
                                                Text(
                                                  _teamviewController
                                                      .data[index].healthStatus,
                                                  style: textBlack3,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              _teamviewController
                                                      .data[index].totalTask
                                                      .toString() +
                                                  " Task and have done ",
                                              style: textGrey,
                                            ),
                                            Text(
                                              _teamviewController
                                                      .data[index].totalTaskDone
                                                      .toString() +
                                                  " Total Last Week",
                                              style: textBlue,
                                            ),
                                          ],
                                        ),
                                      )
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
