import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myteam_2/controllers/profilecontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/utils/constant.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  DateTime _selectedDate;
  TextEditingController _textEditingController = TextEditingController();
  ProfileController _profileController = Get.put(ProfileController());
  Color colorval = Colors.blue;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    print(_profileController.data.value.fullName);
    _profileController.name.text = _profileController.data.value.fullName;
    _profileController.address.text = _profileController.data.value.address;
    _profileController.birthday.text =
        _profileController.data.value.dateOfBirth;
    _profileController.phone.text = _profileController.data.value.phoneNumber;
    if (_profileController.data.value.gender == "Male") {
      _profileController.gender = 0;
    } else {
      _profileController.gender = 1;
    }
    super.initState();
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _profileController.gender = value;
    });
    switch (value) {
      case 0:
        _profileController.gender = 0;

        break;
      case 1:
        _profileController.gender = 1;

        break;
    }
    ;
    print(_profileController.gender);
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
                      controller: _profileController.name,
                      decoration: InputDecoration(
                        hintText: 'Name',
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
                          value.trim().isEmpty ? 'Name required' : null,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _profileController.address,
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
                      controller: _profileController.phone,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
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
                            ? 'Phone Number required'
                            : null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      focusNode: AlwaysDisabledFocusNode(),
                      controller: _profileController.birthday,
                      decoration: InputDecoration(
                        hintText: 'Birth Day',
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
                          value.trim().isEmpty ? 'Birth Day required' : null,
                      onTap: () {
                        _selectDate(context);
                      },
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        new Radio(
                          value: 0,
                          groupValue: _profileController.gender,
                          onChanged: _handleRadioValueChange,
                        ),
                        new Text(
                          'Male',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        new Radio(
                          value: 1,
                          groupValue: _profileController.gender,
                          onChanged: _handleRadioValueChange,
                        ),
                        new Text(
                          'Female',
                          style: new TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    )

                    // Container(
                    //   height: 100,
                    //   child: BlockPicker(
                    //     pickerColor: currentColor,
                    //     onColorChanged: changeColor,
                    //     availableColors: [

                    //     ],
                    //   ),
                    // )
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
                              _profileController.edit();
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

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.blueGrey,
                onSurface: Colors.yellow,
              ),
              dialogBackgroundColor: Colors.blue[500],
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _profileController.birthday
        ..text = DateFormat("yyyy-MM-dd").format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _profileController.birthday.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
