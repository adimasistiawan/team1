import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myteam_2/controllers/companycontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/ui/pages/profile/companyprofile/change_password.dart';
import 'package:myteam_2/ui/pages/profile/companyprofile/edit_company.dart';
import 'package:myteam_2/ui/pages/profile/companyprofile/structure.dart';
import 'package:myteam_2/utils/constant.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  CompanyController _companyController = Get.put(CompanyController());
  File _image;
  final picker = ImagePicker();
  void initState() {
    _companyController.getData();
    super.initState();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _companyController.imageLogo = File(pickedFile.path);
        _companyController.changeLogo();
      } else {
        print('No image selected.');
      }
    });
  }

  Future camera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _companyController.imageLogo = File(pickedFile.path);
        _companyController.changeLogo();
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

  void invite() {
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 80,
              child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _companyController.emailinvite,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: blue,
                                width: 0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: blue,
                                width: 0,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 13,
                            color: blue,
                            fontWeight: FontWeight.normal,
                          ),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return 'Email required';
                            } else if (value.trim().length < 3) {
                              return 'Minimum 3 characters';
                            } else if (!EmailValidator.validate(value)) {
                              return "Please enter a valid email";
                            }
                          }),
                    ],
                  )),
            ),
            actions: [
              FlatButton(
                child: Text('Invite'),
                onPressed: () {
                  if (formkey.currentState.validate()) {
                    _companyController.invite();
                  }
                },
              ),
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  _companyController.emailinvite.clear();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cloud,
        body: Obx(() => _companyController.data.value.companyName == null
            ? Center(child: CircularProgressIndicator())
            : ListView(children: [
                Container(
                    height: 330,
                    color: red,
                    padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //-----------header

                          Text("Company Profile", style: textWhite),
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
                                        backgroundImage: NetworkImage(_companyController
                                                    .data.value.logoUrl ==
                                                "http://172.104.161.39/myteam/public/raw/profile"
                                            ? "https://thumbs.dreamstime.com/b/default-avatar-photo-placeholder-profile-icon-eps-file-easy-to-edit-default-avatar-photo-placeholder-profile-icon-124557887.jpg"
                                            : _companyController
                                                .data.value.logoUrl),
                                        backgroundColor: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 18),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            _companyController
                                                    .data.value.companyName ??
                                                "-",
                                            style: textWhite2),
                                        Text(
                                            _companyController
                                                    .data.value.contact ??
                                                "-",
                                            style: textWhite3),
                                        Text(
                                            _companyController
                                                    .data.value.website ??
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
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 10, top: 10),
                                              child: Text(
                                                "Admin",
                                                style: textWhite4,
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Text(
                                                "Address",
                                                style: textWhite4,
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Text(
                                                "Company ID",
                                                style: textWhite4,
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Text(
                                                "Account Registered",
                                                style: textWhite4,
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Text(
                                                "Account Activation",
                                                style: textWhite4,
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Text(
                                                "Valid Until",
                                                style: textWhite4,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 10, top: 10),
                                                  child: Text(
                                                    _companyController.data
                                                            .value.adminName ??
                                                        "-",
                                                    style: textWhite4,
                                                  )),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Text(
                                                    _companyController.data
                                                            .value.address ??
                                                        "-",
                                                    style: textWhite4,
                                                  )),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                child: Text(
                                                  _companyController.data.value
                                                          .kodePerusahaan ??
                                                      "-",
                                                  style: textWhite4,
                                                ),
                                              ),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Text(
                                                    _companyController
                                                            .data
                                                            .value
                                                            .strRegisterPackage ??
                                                        "-",
                                                    style: textWhite4,
                                                  )),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Text(
                                                    _companyController.data
                                                            .value.strActive ??
                                                        "-",
                                                    style: textWhite4,
                                                  )),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 10),
                                                  child: Text(
                                                    _companyController
                                                            .data
                                                            .value
                                                            .strValidUntil ??
                                                        "-",
                                                    style: textWhite4,
                                                  )),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
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
                                onTap: () => Get.to(EditCompany()),
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
                                onTap: () => Get.to(ChangePasswordCompany()),
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
                                onTap: () => Get.to(StructurePage()),
                                leading: Icon(
                                  Icons.supervised_user_circle,
                                  color: black,
                                ),
                                title: Text(
                                  "Structure",
                                  style: textBlack4,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              child: ListTile(
                                onTap: () => invite(),
                                leading: Icon(
                                  Icons.group_add,
                                  color: black,
                                ),
                                title: Text(
                                  "Invite",
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
              ])));
  }
}
