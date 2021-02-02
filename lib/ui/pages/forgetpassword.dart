import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/logincontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/utils/constant.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final LoginController _loginController = Get.put(LoginController());
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
                    "Forget your Password",
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
                          keyboardType: TextInputType.emailAddress,
                          controller: _loginController.email,
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
                            if (value.trim().isEmpty) {
                              return 'Email required';
                            } else if (value.trim().length < 3) {
                              return 'Minimum 3 characters';
                            } else if (!EmailValidator.validate(value)) {
                              return "Please enter a valid email";
                            }
                          }),
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
                                'Submit',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                if (formkey.currentState.validate()) {
                                  _loginController.forgetPassword();
                                }
                              })),
                      SizedBox(
                          width: double.infinity, // specific value
                          child: MaterialButton(
                              color: Colors.white,
                              splashColor: Colors.white,
                              height: 45,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Back',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () => Get.back())),
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
