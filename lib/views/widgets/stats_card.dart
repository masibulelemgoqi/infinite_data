import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/helpers/helper.dart';

Widget makeStatsCard({number, caption, infoMessage}) {
  return AspectRatio(
    aspectRatio: 3 / 3,
    child: Container(
      margin: EdgeInsets.only(right: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 42.0,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 0,
                  height: 20,
                  width: 20,
                  child: Tooltip(
                    waitDuration: Duration(milliseconds: 100),
                    showDuration: Duration(seconds: 2),
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(15.0),
                    message: infoMessage,
                    preferBelow: false,
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.white54,
                      size: 25.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            number,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              caption,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white60,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.0),
        ],
      ),
    ),
  );
}
