import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/helpers/helper.dart';
import 'package:infinite_data/models/class/screening.dart';
import 'package:infinite_data/models/class/user.dart';
import 'package:infinite_data/models/data/responseHandler.dart';
import 'package:infinite_data/routes/routes.gr.dart';

class AddTemperature extends StatefulWidget {
  final String clientId;
  const AddTemperature({@required this.clientId});
  @override
  _AddTemperatureState createState() => _AddTemperatureState();
}

class _AddTemperatureState extends State<AddTemperature> {
  TextEditingController _temperatureController = TextEditingController();
  String _clientId;
  Screening _screening = Screening();
  User _user = User();

  @override
  void initState() {
    _clientId = widget.clientId;
    super.initState();
  }

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
                child: Form(
                  child: TextFormField(
                    controller: _temperatureController,
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
              ),
              SizedBox(height: 30.0),
              MaterialButton(
                height: 50.0,
                elevation: 1,
                color: mainBlue,
                onPressed: () {
                  saveTemperature();
                },
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

  saveTemperature() async {
    String temperature = _temperatureController.text;
    if (temperature.isNotEmpty) {
      double temp = double.parse(temperature);
      _screening.clientId = _clientId;
      DocumentSnapshot doc = await _user.currentUserDoc();
      _user.populateUser(doc);
      _screening.companyId = _user.getCompanyId();
      _screening.status = temp > 37 ? 'Danger' : 'Safe';
      _screening.temperature = temp;
      ResponseHandler handler = await _screening.addScreening(_screening);

      if (handler.success) {
        Navigator.of(Routes.navigatorKey.currentContext).pop();
        _temperatureController.text = '';
      } else {
        print(handler.message);
      }
    }
  }
}
