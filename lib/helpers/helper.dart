import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textColor = Color(0xFFBEBEBE);
final mainBlue = Color(0xFF20ABE2);
final darkBlue = Color(0xFF1183B0);
final darkColor = Color(0xFF575A89);
final hintColor = Color(0xFFDEDEDE);
final backgroundColor = Color(0xFFF3F5FA);
final mainOrange = Color(0xFFFC6E2E);
final darkOrange = Color(0xFFD44D11);

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

Widget makeCard(
    {context, packageSize, packageRange, price, startColor, endColor}) {
  return GestureDetector(
    onTap: () {},
    child: AspectRatio(
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
                        price,
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
          ],
        ),
      ),
    ),
  );
}
