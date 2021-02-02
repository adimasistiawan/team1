import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myteam_2/controllers/logincontroller.dart';
import 'package:myteam_2/shared/theme.dart';
import 'package:myteam_2/ui/pages/forgetpassword.dart';
import 'package:myteam_2/ui/pages/register.dart';
import 'package:myteam_2/utils/constant.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    "Sign In",
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
                        controller: _loginController.username,
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
                        controller: _loginController.password,
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
                        validator: (value) =>
                            value.trim().isEmpty ? 'Password required' : null,
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
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                if (formkey.currentState.validate()) {
                                  _loginController.login();
                                }
                              })),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(ForgetPassword()),
                        child: Text("Forget your password ? ",
                            style: TextStyle(
                                color: blue, fontWeight: FontWeight.w800)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Text("Dont have an account yet? ",
                          style: TextStyle(
                              color: blue, fontWeight: FontWeight.w800)),
                      GestureDetector(
                        onTap: () => Get.to(RegisterPage()),
                        child: Text("Register",
                            style: TextStyle(
                                color: blue, fontWeight: FontWeight.w800)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
