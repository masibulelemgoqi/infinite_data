import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/animations/fade_animation.dart';
import 'package:infinite_data/helpers/helper.dart';
import 'package:infinite_data/models/class/package.dart';
import 'package:infinite_data/views/widgets/package_card.dart';

class Packages extends StatefulWidget {
  @override
  _PackagesState createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  Package _package = Package();
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
                    'Average Packages',
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
              StreamBuilder(
                stream: _package.getPackages('AVERAGE'),
                builder:
                    (BuildContext ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    QuerySnapshot data = snapshot.data;
                    return Container(
                      height: 250.0,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: data.docs.length,
                        padding: const EdgeInsets.only(bottom: 20, left: 30),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          _package.populatePackages(data.docs[index]);
                          var range = _package.getClientsMax() ==
                                  _package.getClientsMin()
                              ? '${_package.getClientsMax()}+'
                              : '${_package.getClientsMin()} - ${_package.getClientsMax()}';
                          return FadeAnimation(
                            1.6,
                            makeCard(
                              package: _package,
                              id: _package.getId(),
                              context: context,
                              packageSize: _package.getName(),
                              packageRange: range,
                              price: _package.getPrice(),
                              startColor: darkBlue,
                              endColor: mainBlue,
                            ),
                          );
                        },
                      ),
                    );
                  }

                  return Container();
                },
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
              StreamBuilder(
                stream: _package.getPackages('INFINITE'),
                builder:
                    (BuildContext ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    QuerySnapshot data = snapshot.data;
                    return Container(
                      height: 250.0,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: data.docs.length,
                        padding: const EdgeInsets.only(bottom: 20, left: 30),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          _package.populatePackages(data.docs[index]);
                          var range = _package.getClientsMax() ==
                                  _package.getClientsMin()
                              ? '${_package.getClientsMax()}+'
                              : '${_package.getClientsMin()} - ${_package.getClientsMax()}';
                          return FadeAnimation(
                            1.6,
                            makeCard(
                              package: _package,
                              id: _package.getId(),
                              context: context,
                              packageSize: _package.getName(),
                              packageRange: range,
                              price: _package.getPrice(),
                              startColor: darkOrange,
                              endColor: mainOrange,
                            ),
                          );
                        },
                      ),
                    );
                  }

                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
