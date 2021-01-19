import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/animations/fade_animation.dart';
import 'package:infinite_data/helpers/helper.dart';
import 'package:infinite_data/models/class/auth.dart';
import 'package:infinite_data/models/class/user.dart';
import 'package:infinite_data/routes/routes.gr.dart';
import 'package:infinite_data/utils/constants.dart';

class WelcomePage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (BuildContext ctx, snapshot) {
        if (snapshot.hasData) {
          User _user = User();
          var _currentUser = Constants.AUTH;
          if (_currentUser.currentUser == null) {
            return pageContent(context);
          } else {
            return StreamBuilder(
              stream: _user.getCurrentUser(),
              builder: (ctx, AsyncSnapshot<DocumentSnapshot> snap) {
                if (snap.hasData) {
                  var data = snap.data;
                  if (data.exists) {
                    _user.populateUser(snap.data);
                    if (_user.getId() == _user.getCompanyId()) {
                      if (_user.getCompletedRegistration()) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Routes.navigator.pushNamed(Routes.searchHome);
                        });
                      } else {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Routes.navigator.pushNamed(Routes.packages);
                        });
                      }
                    } else {
                      // _currentUser.currentUser.delete();
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Routes.navigator
                            .pushReplacementNamed(Routes.searchHome);
                      });
                    }
                  } else {
                    Auth _auth = Auth();
                    _auth.logout();
                  }
                }
                return loader();
              },
            );
          }
        }
        return loader();
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

  // Widget loader() {
  //   return Container(
  //     child: Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  // }
}
