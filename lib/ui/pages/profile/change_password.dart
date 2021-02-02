import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/profilecontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/utils/constant.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  ProfileController _profileController = Get.put(ProfileController());
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: black, //change your color here
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Change Password",
            style: textBlack2,
          ),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      obscureText: true,
                      controller: _profileController.oldpass,
                      decoration: InputDecoration(
                        hintText: 'Old password',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: black,
                            width: 0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: black,
                            width: 0,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        color: black,
                        fontWeight: FontWeight.normal,
                      ),
                      validator: (value) {
                        return value.trim().isEmpty
                            ? 'Old Password required'
                            : value.trim().length < 8
                                ? 'Minimum 8 characters'
                                : null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      obscureText: true,
                      controller: _profileController.newpass,
                      decoration: InputDecoration(
                        hintText: 'New password',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: black,
                            width: 0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: black,
                            width: 0,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        color: black,
                        fontWeight: FontWeight.normal,
                      ),
                      validator: (value) {
                        return value.trim().isEmpty
                            ? 'New Password required'
                            : value.trim().length < 8
                                ? 'Minimum 8 characters'
                                : null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                        obscureText: true,
                        controller: _profileController.connewpass,
                        decoration: InputDecoration(
                          hintText: 'Confirm new password',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: black,
                              width: 0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: black,
                              width: 0,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          color: black,
                          fontWeight: FontWeight.normal,
                        ),
                        validator: (value) {
                          print(_profileController.newpass.text);
                          if (value.trim().isEmpty) {
                            return 'Confirm new password required';
                          } else if (value.trim().length < 8) {
                            return 'Minimum 8 characters';
                          } else if (value != _profileController.newpass.text) {
                            return "Confirm new password doesn't match";
                          }
                        }),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Visibility(
          visible: !keyboardIsOpen,
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    SizedBox(
                      width: 300,
                      child: MaterialButton(
                          color: blue,
                          splashColor: Colors.white,
                          height: 45,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Save',
                            style: textWhite2,
                          ),
                          onPressed: () {
                            if (formkey.currentState.validate()) {
                              _profileController.changePass();
                            }
                          }),
                    )
                  ],
                ),
              ],
            )
          ]),
        ));
  }
}
