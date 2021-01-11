import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/helpers/helper.dart';

Widget makeInput({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(left: 20.0),
        child: Text(
          label,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 18,
              color: textColor,
            ),
          ),
        ),
      ),
      SizedBox(height: 10.0),
      Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10.0),
        child: TextFormField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            fillColor: Colors.white,
            hintText: label,
            hintStyle: TextStyle(color: hintColor),
            border: InputBorder.none,
          ),
        ),
      ),
      SizedBox(height: 20.0),
    ],
  );
}
