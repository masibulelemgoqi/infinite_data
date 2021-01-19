import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:infinite_data/routes/routes.gr.dart';

final textColor = Color(0xFFBEBEBE);
final mainBlue = Color(0xFF20ABE2);
final darkBlue = Color(0xFF1183B0);
final darkColor = Color(0xFF575A89);
final hintColor = Color(0xFFDEDEDE);
final backgroundColor = Color(0xFFF3F5FA);
final mainOrange = Color(0xFFFC8621);
final darkOrange = Color(0xFFE38534);

Widget loader() {
  return Container(
    child: Center(
      child: CircularProgressIndicator(
        backgroundColor: mainOrange,
      ),
    ),
  );
}

void errorFloatingFlushbar(String message) {
  Flushbar(
    duration: Duration(seconds: 2),
    padding: EdgeInsets.all(10),
    borderRadius: 8,
    backgroundGradient: LinearGradient(
      colors: [
        mainOrange,
        darkOrange,
      ],
      stops: [0.7, 1],
    ),
    boxShadows: [
      BoxShadow(
        color: Colors.black45,
        offset: Offset(3, 3),
        blurRadius: 3,
      ),
    ],
    // All of the previous Flushbars could be dismissed by swiping down
    // now we want to swipe to the sides
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    // The default curve is Curves.easeOut
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    title: 'Error',
    message: message,
    isDismissible: true,
    margin: EdgeInsets.symmetric(
      horizontal: 5.0,
      vertical: 15.0,
    ),
    icon: Icon(
      Icons.close,
      color: Colors.white,
    ),
  ).show(Routes.navigatorKey.currentState.context);
}

void successFloatingFlushbar(String message) {
  Flushbar(
    duration: Duration(seconds: 2),
    padding: EdgeInsets.all(10),
    borderRadius: 8,
    backgroundGradient: LinearGradient(
      colors: [
        darkBlue,
        mainBlue,
      ],
      stops: [0.6, 1],
    ),
    boxShadows: [
      BoxShadow(
        color: Colors.black45,
        offset: Offset(3, 3),
        blurRadius: 3,
      ),
    ],
    // All of the previous Flushbars could be dismissed by swiping down
    // now we want to swipe to the sides
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    // The default curve is Curves.easeOut
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    title: 'Success',
    message: message,
    isDismissible: true,
    margin: EdgeInsets.symmetric(
      horizontal: 5.0,
      vertical: 15.0,
    ),
    icon: Icon(
      Icons.check,
      color: Colors.white,
    ),
  ).show(Routes.navigatorKey.currentState.context);
}
