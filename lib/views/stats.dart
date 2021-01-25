import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/helpers/helper.dart';
import 'package:infinite_data/views/widgets/stats_card.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              height: 150.0,
              child: Center(
                child: Row(
                  children: [
                    Text(
                      'Data',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w900,
                          color: darkColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Summary',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w900,
                          color: mainOrange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Today',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: darkColor,
                            ),
                          ),
                        ),
                        Text(
                          'Jan 25, 2021',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 150.0,
                    width: double.infinity,
                    child: ListView(
                      padding: const EdgeInsets.only(bottom: 20, left: 20),
                      scrollDirection: Axis.horizontal,
                      children: [
                        makeStatsCard(
                            caption: 'Screened',
                            number: '879',
                            infoMessage: ''),
                        makeStatsCard(
                            caption: 'High Risk',
                            number: '20',
                            infoMessage:
                                'Those customers have a temperature that is greater than 37.0'),
                        makeStatsCard(
                            caption: 'Never tested',
                            number: '200',
                            infoMessage:
                                'The numebr of customers have never tested with DOH'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'This Month',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: darkColor,
                            ),
                          ),
                        ),
                        Text(
                          'Jan 2021',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 150.0,
                    width: double.infinity,
                    child: ListView(
                      padding: const EdgeInsets.only(bottom: 20, left: 20),
                      scrollDirection: Axis.horizontal,
                      children: [
                        makeStatsCard(
                            caption: 'Screened',
                            number: '7.8k',
                            infoMessage: ''),
                        makeStatsCard(
                            caption: 'High Risk',
                            number: '1.3k',
                            infoMessage:
                                'Those customers have a temperature that is greater than 37.0'),
                        makeStatsCard(
                            caption: 'Never tested',
                            number: '987',
                            infoMessage:
                                'The numebr of customers have never tested with DOH'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
