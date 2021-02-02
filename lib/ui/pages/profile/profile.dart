import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myteam_2/controllers/profilecontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/ui/pages/login.dart';
import 'package:myteam_2/ui/pages/profile/companyprofile/company.dart';
import 'package:myteam_2/ui/pages/profile/change_password.dart';
import 'package:myteam_2/ui/pages/profile/edit_profile.dart';
import 'package:myteam_2/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  ProfileController _profileController = Get.put(ProfileController());
  File _image;
  final picker = ImagePicker();
  void initState() {
    _profileController.getData();
    super.initState();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _profileController.imageProfle = File(pickedFile.path);
        _profileController.changeImage();
      } else {
        print('No image selected.');
      }
    });
  }

  Future camera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _profileController.imageProfle = File(pickedFile.path);
        _profileController.changeImage();
      } else {
        print('No image selected.');
      }
    });
  }

  popup() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Change Image Profile'),
              content: Container(
                height: 120,
                child: Column(
                  children: [
                    Container(
                      child: InkWell(
                        onTap: () => getImage(),
                        child: ListTile(
                          leading: Icon(Icons.image),
                          title: Text("Choose Image", style: textBlack4),
                        ),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () => camera(),
                        child: ListTile(
                          leading: Icon(Icons.camera_alt),
                          title: Text(
                            "Camera",
                            style: textBlack4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _profileController.data.value.email == null
        ? Center(child: CircularProgressIndicator())
        : ListView(children: [
            Container(
                height: 260,
                color: blue,
                padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //-----------header

                      Text("Profile", style: textWhite),
                      Container(
                        margin: EdgeInsets.only(top: 18),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: GestureDetector(
                                  onTap: () => popup(),
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(_profileController
                                                .data.value.imageProfile ==
                                            "http://172.104.161.39/myteam/public/raw/profile"
                                        ? "https://thumbs.dreamstime.com/b/default-avatar-photo-placeholder-profile-icon-eps-file-easy-to-edit-default-avatar-photo-placeholder-profile-icon-124557887.jpg"
                                        : _profileController
                                            .data.value.imageProfile),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        _profileController
                                                .data.value.fullName ??
                                            "-",
                                        style: textWhite2),
                                    Text(
                                        _profileController.data.value.email ??
                                            "-",
                                        style: textWhite3),
                                    Text(
                                        _profileController
                                                .data.value.phoneNumber ??
                                            "-",
                                        style: textWhite3),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 30,
                                  child: ListTile(
                                    leading: Text(
                                      "Position",
                                      style: textWhite4,
                                    ),
                                    title: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, bottom: 10),
                                        child: Text(
                                          _profileController
                                                  .data.value.position ??
                                              "-",
                                          style: textWhite4,
                                        )),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  child: ListTile(
                                    leading: Text(
                                      "Gender",
                                      style: textWhite4,
                                    ),
                                    title: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, bottom: 10),
                                        child: Text(
                                          _profileController
                                                  .data.value.gender ??
                                              "-",
                                          style: textWhite4,
                                        )),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  child: ListTile(
                                    leading: Text(
                                      "Birth Day",
                                      style: textWhite4,
                                    ),
                                    title: Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        _profileController
                                                .data.value.dateOfBirth ??
                                            "-",
                                        style: textWhite4,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  child: ListTile(
                                    leading: Text(
                                      "Address",
                                      style: textWhite4,
                                    ),
                                    title: Container(
                                        padding: EdgeInsets.only(
                                            left: 7, bottom: 10),
                                        child: Text(
                                          _profileController
                                                  .data.value.address ??
                                              "-",
                                          style: textWhite4,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ])),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 18, 10, 18),
              margin: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          child: ListTile(
                            onTap: () => Get.to(EditProfile()),
                            leading: Icon(
                              Icons.edit,
                              color: black,
                            ),
                            title: Text(
                              "Edit Profile",
                              style: textBlack4,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          child: ListTile(
                            onTap: () => Get.to(ChangePassword()),
                            leading: Icon(
                              Icons.lock,
                              color: black,
                            ),
                            title: Text(
                              "Change Password",
                              style: textBlack4,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          child: ListTile(
                            onTap: () => Get.to(CompanyPage()),
                            leading: Icon(
                              Icons.business,
                              color: black,
                            ),
                            title: Text(
                              "My Company",
                              style: textBlack4,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          child: ListTile(
                            onTap: () => Get.to(logout()),
                            leading: Icon(
                              Icons.logout,
                              color: black,
                            ),
                            title: Text(
                              "Logout",
                              style: textBlack4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]));
  }

  logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Get.offAll(LoginPage());
  }
}
