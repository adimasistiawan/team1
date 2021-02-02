import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/homecontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/ui/pages/create_ann.dart';
import 'package:myteam_2/ui/widgets/home/announcement.dart';
import 'package:myteam_2/ui/widgets/home/announcement_list.dart';
import 'package:myteam_2/utils/constant.dart';

class AnnouncementAll extends StatefulWidget {
  @override
  _AnnouncementAllState createState() => _AnnouncementAllState();
}

class _AnnouncementAllState extends State<AnnouncementAll> {
  final HomeController _homecontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Announcement",
          style: textBlack2,
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
        child: Obx(() => _homecontroller.data.value.listAnn.length == 0
            ? Center(child: Text("No Announcements"))
            : ListView.builder(
                shrinkWrap: true,
                itemCount: _homecontroller.data.value.listAnn.length,
                itemBuilder: (context, index) {
                  return AnnouncementList(
                    listAnn: _homecontroller.data.value.listAnn[index],
                  );
                },
              )),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(CreateAnn());
        },
        label: Text(
          'Create',
          style: textBlack2,
        ),
        icon: Icon(
          Icons.add_alert,
          color: black,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
