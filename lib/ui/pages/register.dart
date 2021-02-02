import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/logincontroller.dart';
import 'package:myteam_2/controllers/registercontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/utils/constant.dart';
import 'package:email_validator/email_validator.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController _registerController = Get.put(RegisterController());
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(18, 100, 18, 0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "MyTeam",
                    style: TextStyle(
                      color: blue,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Sign Up",
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
                        // keyboardType: TextInputType.emailAddress,
                        controller: _registerController.username,
                        decoration: InputDecoration(
                          hintText: 'Username',
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
                        validator: (value) =>
                            value.trim().isEmpty ? 'Username required' : null,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _registerController.email,
                        decoration: InputDecoration(
                          hintText: 'Email',
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
                              ? 'Email required'
                              : EmailValidator.validate(value)
                                  ? null
                                  : "Please enter a valid email";
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _registerController.password,
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
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                if (formkey.currentState.validate()) {
                                  _registerController.register();
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
