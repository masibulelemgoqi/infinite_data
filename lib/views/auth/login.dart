import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/animations/fade_animation.dart';
import 'package:infinite_data/helpers/helper.dart';
import 'package:infinite_data/models/class/auth.dart';
import 'package:infinite_data/models/class/user.dart';
import 'package:infinite_data/models/data/ResponseData.dart';
import 'package:infinite_data/models/data/responseHandler.dart';
import 'package:infinite_data/routes/routes.gr.dart';
import 'package:infinite_data/utils/validator.dart';
import 'package:infinite_data/views/widgets/create_input.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  Auth _auth = Auth();
  Validator _validator = Validator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20.0,
            color: darkColor,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      0.8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Infinite',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Data',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.w900,
                                color: mainBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0),
                    FadeAnimation(
                      1,
                      Text(
                        'Login',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FadeAnimation(
                    1.2,
                    makeInput(
                        label: 'Email', editingController: _emailController),
                  ),
                  FadeAnimation(
                    1.4,
                    makeInput(
                        label: 'Password',
                        obscureText: true,
                        editingController: _passwordController),
                  ),
                  FadeAnimation(
                    1.6,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: darkColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  FadeAnimation(
                    1.8,
                    MaterialButton(
                      height: 50.0,
                      elevation: 1,
                      color: mainBlue,
                      onPressed: () {
                        loginMethod();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeAnimation(
                    2,
                    Text(
                      "Don't have an accout?",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: darkColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  FadeAnimation(
                    2.2,
                    GestureDetector(
                      onTap: () {
                        Routes.navigator.pushNamed(Routes.register);
                      },
                      child: Text(
                        "Register",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: darkColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loader() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  loginMethod() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (!_validator.validEmail(email).success) {
      print(_validator.validEmail(email).message);
      return;
    }

    if (password.length < 6) {
      print('Invalid password');
    }

    ResponseHandler res = await _auth.login(email, password);

    if (res.success) {
      User _user = User();
      _user.getCurrentUser().listen((snap) {
        if (snap.exists) {
          _user.populateUser(snap);
          if (_user.getId() == _user.getCompanyId()) {
            print(_user.getCompletedRegistration());
            if (_user.getCompletedRegistration()) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Routes.navigator.pushNamed(Routes.searchHome);
              });
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Routes.navigator.pushNamed(Routes.packages);
              });
            }
          } else {
            // _currentUser.currentUser.delete();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Routes.navigator.pushReplacementNamed(Routes.register);
            });
          }
        } else {
          _auth.logout();
        }
      });
    } else {
      print(res.message);
    }
  }
}
