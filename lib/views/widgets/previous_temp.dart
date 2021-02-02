import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/helpers/helper.dart';
import 'package:infinite_data/models/class/screening.dart';

Widget makeTemperature({clientId}) {
  Screening _screening = Screening();
  return Container(
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        colors: [
          darkBlue,
          mainBlue,
        ],
      ),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey[350],
      //     blurRadius: 10.0,
      //     offset: Offset(5, 10),
      //   )
      // ],
    ),
    child: StreamBuilder(
        stream: _screening.getScreening(clientId),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loader();
          }

          // List<DocumentSnapshot> docs = snapshot.data.docs;
          // if (docs.length == 0) {
          //   return Center(
          //     child: Text(
          //       'No record',
          //       style: GoogleFonts.roboto(
          //         textStyle: TextStyle(
          //           fontSize: 30.0,
          //           fontWeight: FontWeight.w900,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ),
          //   );
          // }

          // _screening.populateScreening(docs[0]);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                children: [
                  makeRowItem(
                    screener: 'Savoy Spar',
                    date: 'Today',
                    temp: '40.5',
                  ),
                  makeRowItem(
                    screener: 'Apac Consulting',
                    date: 'Yesterday',
                    temp: '38.3',
                  ),
                  makeRowItem(
                    screener: 'Walter Sisulu University',
                    date: 'Jan 17, 2021',
                    temp: '33.1',
                  )
                ],
              )
            ],
          );
        }),
  );
}

Widget makeRowItem({screener, date, temp}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120.0,
            child: Text(
              screener,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            date,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            temp + '\u2103',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 15.0)
    ],
  );
}
