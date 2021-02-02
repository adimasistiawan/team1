import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myteam_2/controllers/announcementcontroller.dart';
import 'package:myteam_2/controllers/homecontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/ui/widgets/home/announcement.dart';
import 'package:myteam_2/ui/widgets/home/announcement_list.dart';
import 'package:myteam_2/utils/constant.dart';

class CreateAnn extends StatefulWidget {
  @override
  _CreateAnnState createState() => _CreateAnnState();
}

class _CreateAnnState extends State<CreateAnn> {
  final HomeController _homecontroller = Get.find();
  DateTime _selectedDate;
  TextEditingController _textEditingController = TextEditingController();
  AnnouncementController anncontroller = Get.put(AnnouncementController());
  Color colorval = Colors.blue;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Color currentColor = Colors.blue;

  void changeColor(Color color) {
    print(color);
    setState(() => currentColor = color);
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
            "Create Announcement",
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
                      controller: anncontroller.title,
                      decoration: InputDecoration(
                        hintText: 'Title',
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
                          value.trim().isEmpty ? 'Title required' : null,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: anncontroller.description,
                      decoration: InputDecoration(
                        hintText: 'Description',
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
                            ? 'Description required'
                            : value.trim().length < 6
                                ? 'Minimum 6 characters'
                                : null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      focusNode: AlwaysDisabledFocusNode(),
                      controller: anncontroller.validuntil,
                      decoration: InputDecoration(
                        hintText: 'Valid until',
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
                          value.trim().isEmpty ? 'Valid until required' : null,
                      onTap: () {
                        _selectDate(context);
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Color",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Container(
                      height: 100,
                      child: MaterialColorPicker(
                        allowShades: false,
                        onMainColorChange: (Color color) {
                          // Handle color changes
                          anncontroller.color = color;
                        },
                        selectedColor: colorval,
                        colors: [
                          Colors.blue,
                          Colors.red,
                          Colors.yellow,
                        ],
                      ),
                    ),
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
                            'Create',
                            style: textWhite2,
                          ),
                          onPressed: () {
                            if (formkey.currentState.validate()) {
                              anncontroller.createAnn();
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
      anncontroller.validuntil
        ..text = DateFormat("yyyy-MM-dd").format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: anncontroller.validuntil.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
