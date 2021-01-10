import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/animations/fade_animation.dart';
import 'package:infinite_data/helpers/helper.dart';
import 'package:infinite_data/views/auth/login.dart';
import 'package:infinite_data/views/auth/packages.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
      body: SingleChildScrollView(
        child: Container(
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
                    FadeAnimation(
                      1,
                      Text(
                        'Register',
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
                    makeInput(label: 'Company Name'),
                  ),
                  FadeAnimation(
                    1.4,
                    makeInput(label: 'Company Address'),
                  ),
                  FadeAnimation(
                    1.8,
                    makeInput(label: 'Email'),
                  ),
                  FadeAnimation(
                    2,
                    makeInput(label: 'Contact No.'),
                  ),
                  FadeAnimation(
                    2.2,
                    makeInput(label: 'Password'),
                  ),
                  FadeAnimation(
                    2.4,
                    makeInput(label: 'Confirm Password'),
                  ),
                  SizedBox(height: 20.0),
                  FadeAnimation(
                    2.6,
                    MaterialButton(
                      height: 50.0,
                      elevation: 1,
                      color: darkBlue,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Packages()),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Text(
                        'Register',
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
              SizedBox(height: 60.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeAnimation(
                    2,
                    Text(
                      "Already have an accout?",
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text(
                        "Login",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
