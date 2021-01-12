import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/animations/fade_animation.dart';
import 'package:infinite_data/helpers/helper.dart';
import 'package:infinite_data/routes/routes.gr.dart';

class WelcomePage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (BuildContext ctx, snapshot) {
        return !snapshot.hasData ? loader() : pageContent(context);
      },
    );
  }

  Widget pageContent(context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 70.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimation(
                    0.8,
                    Text(
                      'Welcome',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  FadeAnimation(
                    1,
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              FadeAnimation(
                1.2,
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/img2.png'),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FadeAnimation(
                    1.4,
                    MaterialButton(
                      height: 50.0,
                      elevation: 1,
                      color: mainBlue,
                      onPressed: () {
                        Routes.navigator.pushNamed(Routes.login);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Text(
                        'Login',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  FadeAnimation(
                    1.6,
                    MaterialButton(
                      height: 50.0,
                      elevation: 1,
                      color: darkBlue,
                      onPressed: () {
                        Routes.navigator.pushNamed(Routes.register);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Text(
                        'Register',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loader() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
