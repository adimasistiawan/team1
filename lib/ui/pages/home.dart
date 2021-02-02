import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/homecontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/ui/pages/announcement_all.dart';
import 'package:myteam_2/ui/pages/profile/companyprofile/company.dart';
import 'package:myteam_2/ui/pages/profile/profile.dart';
import 'package:myteam_2/ui/widgets/home/announcement.dart';
import 'package:myteam_2/ui/widgets/home/menu.dart';
import 'package:myteam_2/ui/widgets/home/summarycard.dart';
import 'package:myteam_2/utils/constant.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _homecontroller = Get.put(HomeController());
  @override
  void initState() {
    // TODO: implement initState
    _homecontroller.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _homecontroller.data.value.imageProfileLink == null
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/bgheader.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //-----------header
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Hello", style: textWhite),
                                  Obx(() => Text(
                                        _homecontroller.data.value.greeting ==
                                                null
                                            ? ""
                                            : _homecontroller
                                                    .data.value.greeting +
                                                ", " +
                                                _homecontroller
                                                    .data.value.fullName +
                                                "(" +
                                                _homecontroller
                                                    .data.value.positionName +
                                                ")",
                                        style: textWhite2,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 75),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Menu(
                                  icon: 'assets/videocall.png',
                                  text: 'Meetings',
                                ),
                                Menu(
                                  icon: 'assets/care.png',
                                  text: 'Health',
                                ),
                                Menu(
                                  icon: 'assets/completed-task.png',
                                  text: 'Check In',
                                ),
                                Menu(
                                  icon: 'assets/check.png',
                                  text: 'Approval',
                                ),
                              ],
                            ),
                          )
                        ])),
                Container(
                  padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => _homecontroller.data.value.strTaskToday == null
                          ? Container(
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.only(top: 50, bottom: 50),
                              child: Center(child: CircularProgressIndicator()))
                          : Container(
                              margin: EdgeInsets.only(top: 20),
                              child: GridView.count(
                                controller: new ScrollController(
                                    keepScrollOffset: false),
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                childAspectRatio: 2,
                                children: [
                                  SummaryCard(
                                    number:
                                        _homecontroller.data.value.strTaskToday,
                                    text: "Taks Total",
                                    color: purple,
                                  ),
                                  SummaryCard(
                                    number: _homecontroller.data.value.strDone,
                                    text: "Done",
                                    color: leaf,
                                  ),
                                  SummaryCard(
                                    number: _homecontroller
                                        .data.value.strOutstanding,
                                    text: "Outstanding",
                                    color: yellow,
                                  ),
                                  SummaryCard(
                                    number:
                                        _homecontroller.data.value.strBacklog,
                                    text: "Rejected",
                                    color: red,
                                  ),
                                ],
                              ),
                            )),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Announcement", style: textBlack4),
                            GestureDetector(
                                onTap: () => Get.to(AnnouncementAll()),
                                child: Text("View all", style: textBlack4)),
                          ],
                        ),
                      ),
                      Container(
                        height: 110,
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child:
                            Obx(() => _homecontroller.data.value.listAnn == null
                                ? Center(child: CircularProgressIndicator())
                                : _homecontroller.data.value.listAnn.length == 0
                                    ? Center(child: Text("No Announcements"))
                                    : ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: _homecontroller
                                                    .data.value.listAnn.length <
                                                4
                                            ? _homecontroller
                                                .data.value.listAnn.length
                                            : 4,
                                        itemBuilder: (context, index) {
                                          return Announcement(
                                            listann: _homecontroller
                                                .data.value.listAnn[index],
                                          );
                                        },
                                      )),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
