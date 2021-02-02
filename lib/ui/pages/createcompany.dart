import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/companycontroller.dart';
import 'package:myteam_2/utils/constant.dart';

class CreateCompany extends StatefulWidget {
  @override
  _CreateCompanyState createState() => _CreateCompanyState();
}

class _CreateCompanyState extends State<CreateCompany> {
  final CompanyController _companyController = Get.put(CompanyController());
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(18, 50, 18, 0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Create Company",
                    style: TextStyle(
                      color: blue,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Form(
                  key: formkey,
                  child: Column(
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
                          fontSize: 16,
                          color: blue,
                          fontWeight: FontWeight.normal,
                        ),
                        validator: (value) => value.trim().isEmpty
                            ? 'Company Name required'
                            : null,
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
                          fontSize: 16,
                          color: blue,
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
                          fontSize: 16,
                          color: blue,
                          fontWeight: FontWeight.normal,
                        ),
                        validator: (value) {
                          return value.trim().isEmpty
                              ? 'Contact required'
                              : null;
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
                          fontSize: 16,
                          color: blue,
                          fontWeight: FontWeight.normal,
                        ),
                        validator: (value) {
                          return value.trim().isEmpty
                              ? 'Website required'
                              : null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _companyController.newpass,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontSize: 16,
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
                          fontSize: 16,
                          color: blue,
                          fontWeight: FontWeight.normal,
                        ),
                        validator: (value) {
                          return value.trim().isEmpty
                              ? 'Password required'
                              : value.trim().length < 6
                                  ? 'Minimum 8 characters'
                                  : null;
                        },
                        obscureText: true,
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                          width: double.infinity, // specific value
                          child: MaterialButton(
                              color: blue,
                              splashColor: Colors.white,
                              height: 45,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Create',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                if (formkey.currentState.validate()) {
                                  _companyController.create();
                                }
                              })),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
