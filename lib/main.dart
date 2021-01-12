import 'package:flutter/material.dart';
import 'package:infinite_data/routes/routes.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.welcomePage,
      onGenerateRoute: Routes.onGenerateRoute,
      navigatorKey: Routes.navigatorKey,
    );
  }
}
