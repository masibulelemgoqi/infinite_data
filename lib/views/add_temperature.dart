import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/helpers/helper.dart';

class AddTemperature extends StatefulWidget {
  @override
  _AddTemperatureState createState() => _AddTemperatureState();
}

class _AddTemperatureState extends State<AddTemperature> {
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
            color: textColor,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Temperature',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: darkColor,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                alignment: Alignment.center,
                child: TextField(
                  textAlign: TextAlign.center,
                  autofocus: true,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.w900,
                      color: mainBlue,
                    ),
                  ),
                  cursorColor: mainBlue,
                  cursorWidth: 5.0,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '0.0\u2103',
                    hintStyle: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w900,
                        color: hintColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              MaterialButton(
                height: 50.0,
                elevation: 1,
                color: mainBlue,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Text(
                  'Save',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
