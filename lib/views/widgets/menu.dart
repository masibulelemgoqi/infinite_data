import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/helpers/helper.dart';
import 'package:infinite_data/models/class/auth.dart';
import 'package:infinite_data/models/class/company.dart';
import 'package:infinite_data/routes/routes.gr.dart';

class SideMenu extends StatelessWidget {
  Auth _auth = Auth();
  Company _company = Company();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FutureBuilder(
                      future: _company.getCompanyNameByUserCurrentUser(),
                      builder: (ctx, AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        }
                        _company.populateCompany(snapshot.data);

                        return Text(
                          _company.companyName,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),
                  SizedBox(height: 20.0)
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: darkBlue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text(
              'Search',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            onTap: () => {
              Navigator.of(context).pop(),
            },
          ),
          ListTile(
            leading: Icon(Icons.stacked_line_chart_outlined),
            title: Text(
              'Stats',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            onTap: () => {
              Routes.navigator.popAndPushNamed(Routes.statistics),
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text(
              'Admin',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            onTap: () => {
              Routes.navigator.popAndPushNamed(Routes.appAdmin),
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text(
              'Support',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            onTap: () => {
              Routes.navigator.popAndPushNamed(Routes.support),
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Logout',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            onTap: () => {
              _auth.logout(),
            },
          ),
        ],
      ),
    );
  }
}
