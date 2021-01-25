import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/helpers/helper.dart';
import 'package:infinite_data/models/class/screening.dart';

Widget makeTemperature({clientId}) {
  Screening _screening = Screening();
  return Center(
    child: Container(
      padding: EdgeInsets.all(10.0),
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            darkBlue,
            mainBlue,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[350],
            blurRadius: 10.0,
            offset: Offset(5, 10),
          )
        ],
      ),
      child: StreamBuilder(
          stream: _screening.getScreening(clientId),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loader();
            }

            List<DocumentSnapshot> docs = snapshot.data.docs;
            if (docs.length == 0) {
              return Center(
                child: Text(
                  'No record',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }

            _screening.populateScreening(docs[0]);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _screening.temperature.toStringAsFixed(1),
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      '\u2103',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Last Temperature',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            );
          }),
    ),
  );
}
