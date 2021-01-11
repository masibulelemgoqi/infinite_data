import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/animations/fade_animation.dart';
import 'package:infinite_data/helpers/helper.dart';
import 'package:infinite_data/views/widgets/package_card.dart';

class Packages extends StatefulWidget {
  @override
  _PackagesState createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
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
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                        'Choose Package Plan',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    FadeAnimation(
                      1.2,
                      Text(
                        'The package you choose is the estimation of how many people enter your shop a day.',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: FadeAnimation(
                  1.4,
                  Text(
                    'Avarage Packages',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: darkColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                height: 250.0,
                width: double.infinity,
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 20, left: 30),
                  scrollDirection: Axis.horizontal,
                  children: [
                    FadeAnimation(
                      1.6,
                      makeCard(
                        context: context,
                        packageSize: "X-small",
                        packageRange: '0 - 100',
                        price: 'R120',
                        startColor: darkBlue,
                        endColor: mainBlue,
                      ),
                    ),
                    FadeAnimation(
                      1.8,
                      makeCard(
                        context: context,
                        packageSize: "Small",
                        packageRange: '100 - 300',
                        price: 'R200',
                        startColor: darkBlue,
                        endColor: mainBlue,
                      ),
                    ),
                    FadeAnimation(
                      2,
                      makeCard(
                        context: context,
                        packageSize: "Medium",
                        packageRange: '300 - 500',
                        price: 'R300',
                        startColor: darkBlue,
                        endColor: mainBlue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: FadeAnimation(
                  1.4,
                  Text(
                    'Mega Packages',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: darkColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                height: 250.0,
                width: double.infinity,
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 20, left: 30),
                  scrollDirection: Axis.horizontal,
                  children: [
                    FadeAnimation(
                      1.6,
                      makeCard(
                        context: context,
                        packageSize: "Large",
                        packageRange: '500 - 700',
                        price: 'R500',
                        startColor: darkOrange,
                        endColor: mainOrange,
                      ),
                    ),
                    FadeAnimation(
                      1.8,
                      makeCard(
                        context: context,
                        packageSize: "X-large",
                        packageRange: '700 - 2000',
                        price: 'R1000',
                        startColor: darkOrange,
                        endColor: mainOrange,
                      ),
                    ),
                    FadeAnimation(
                      2,
                      makeCard(
                        context: context,
                        packageSize: "Infinite",
                        packageRange: '2000+',
                        price: 'R3000',
                        startColor: darkOrange,
                        endColor: mainOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
