import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/helpers/helper.dart';
import 'package:infinite_data/models/class/auth.dart';
import 'package:infinite_data/models/class/package.dart';
import 'package:infinite_data/models/data/responseHandler.dart';
import 'package:infinite_data/routes/routes.gr.dart';

Widget makeCard({
  context,
  id,
  Package package,
  packageSize,
  packageRange,
  price,
  startColor,
  endColor,
}) {
  return AspectRatio(
    aspectRatio: 4 / 5,
    child: Container(
      margin: EdgeInsets.only(right: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            startColor,
            endColor,
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
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  packageSize,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'R${price}',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Text(
                      ' / month',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: textColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(height: 15.0),
          Wrap(
            alignment: WrapAlignment.start,
            children: [
              Icon(
                Icons.check,
                color: Colors.white,
                size: 20.0,
              ),
              SizedBox(width: 10.0),
              Text(
                packageRange,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 5.0),
              Text(
                'Customers / day',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            onPressed: () async {
              Auth _auth = Auth();
              ResponseHandler handler = await _auth.subscribe(package);

              if (handler.success) {
                Routes.navigator.pushReplacementNamed(Routes.searchHome);
              } else {
                print(handler.message);
              }
            },
            color: darkColor,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              side: BorderSide.none,
            ),
            child: Text(
              'Subscribe',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
