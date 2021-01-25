import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/helpers/helper.dart';
import 'package:infinite_data/models/class/auth.dart';
import 'package:infinite_data/routes/routes.gr.dart';

class SideMenu extends StatelessWidget {
  Auth _auth = Auth();
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
                  Text(
                    'Kwik Spar, Kei Mthatha',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0)
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: darkBlue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text(
              'Welcome',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            onTap: () => {},
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
              Routes.navigator.pushNamed(Routes.statistics),
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
            onTap: () => {Navigator.of(context).pop()},
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
              Navigator.of(context).pop(),
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
