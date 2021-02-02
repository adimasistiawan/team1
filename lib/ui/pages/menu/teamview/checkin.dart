import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/teamviewcontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/utils/constant.dart';

class CheckinPage extends StatefulWidget {
  @override
  _CheckinPageState createState() => _CheckinPageState();
}

class _CheckinPageState extends State<CheckinPage> {
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
          "Check-in Log",
          style: textBlack2,
        ),
      ),
      body: Obx(
        () => _teamviewController.checkin == null
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
                child: Column(
                  children: [
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: _teamviewController.checkin.length,
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
                                                  .checkin[index]
                                                  .imageProfile ==
                                              "http://172.104.161.39/myteam/public/raw/profile/default"
                                          ? "https://thumbs.dreamstime.com/b/default-avatar-photo-placeholder-profile-icon-eps-file-easy-to-edit-default-avatar-photo-placeholder-profile-icon-124557887.jpg"
                                          : _teamviewController
                                              .checkin[index].imageProfile),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _teamviewController
                                                        .checkin[index]
                                                        .fullName,
                                                    style: textBlack3,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Text("Check in : ",
                                                      style: textBlack3),
                                                  Text(
                                                    _teamviewController
                                                                .checkin[index]
                                                                .checkin ==
                                                            null
                                                        ? "-"
                                                        : _teamviewController
                                                            .checkin[index]
                                                            .checkin
                                                            .toString(),
                                                    style: textBlack3,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                                    )
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
