import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myteam_2/controllers/companycontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/utils/constant.dart';

class EditCompany extends StatefulWidget {
  @override
  _EditCompanyState createState() => _EditCompanyState();
}

class _EditCompanyState extends State<EditCompany> {
  CompanyController _companyController = Get.put(CompanyController());

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _companyController.name.text = _companyController.data.value.companyName;
    _companyController.address.text = _companyController.data.value.address;
    _companyController.contact.text = _companyController.data.value.contact;
    _companyController.website.text = _companyController.data.value.website;

    super.initState();
  }

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
            "Edit Profile",
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
                      controller: _companyController.name,
                      decoration: InputDecoration(
                        hintText: 'Company Name',
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
                      validator: (value) =>
                          value.trim().isEmpty ? 'Company Name required' : null,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _companyController.address,
                      decoration: InputDecoration(
                        hintText: 'Address',
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
                            ? 'Address required'
                            : value.trim().length < 6
                                ? 'Minimum 6 characters'
                                : null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _companyController.contact,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Contact',
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
                        return value.trim().isEmpty ? 'Contact required' : null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _companyController.website,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Website',
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
                        return value.trim().isEmpty ? 'Website required' : null;
                      },
                    ),
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
                            'Update',
                            style: textWhite2,
                          ),
                          onPressed: () {
                            if (formkey.currentState.validate()) {
                              _companyController.edit();
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

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
