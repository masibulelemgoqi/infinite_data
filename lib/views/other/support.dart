import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/helpers/helper.dart';

class Support extends StatelessWidget {
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
        child: Column(
          children: [
            Container(
              height: 200.0,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.support_agent_outlined,
                    size: 45.0,
                    color: mainBlue,
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'How can we \nhelp you?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 25,
                          color: darkColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: FlatButton(
                padding: const EdgeInsets.all(15.0),
                onPressed: () {},
                splashColor: mainOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: BorderSide(color: mainOrange, width: 2.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Call Us Now',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          color: mainOrange,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.phone,
                      size: 25.0,
                      color: mainOrange,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 150.0),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 80.0,
                    width: 80.0,
                    child: RaisedButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(15.0),
                      color: darkBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: mainBlue, width: 6.0),
                      ),
                      child: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'support@infintogroup.co.za',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 18.0,
                        color: darkBlue,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Text(
                    '+(27) 00 000 0000',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                        color: darkBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
