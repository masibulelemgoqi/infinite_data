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
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
              Wrap(
                children: [
                  Row(
                    children: [
                      Text(
                        'Savoy Spar',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        'Today',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        '56.8',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          );
        }),
  );
}
