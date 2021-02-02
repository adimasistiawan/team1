import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/companycontroller.dart';
import 'package:myteam_2/utils/constant.dart';

class JoinCompany extends StatefulWidget {
  @override
  _JoinCompanyState createState() => _JoinCompanyState();
}

class _JoinCompanyState extends State<JoinCompany> {
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
                    "Join Company",
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
                        controller: _companyController.company_code,
                        decoration: InputDecoration(
                          hintText: 'Company Code',
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
                              ? 'Company Code required'
                              : value.trim().length < 3
                                  ? 'Minimum 3 characters'
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
                              : value.trim().length < 8
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
                                'Join',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                if (formkey.currentState.validate()) {
                                  _companyController.join();
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
